import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
import 'package:background_fetch/background_fetch.dart' as bf;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids_tracker/core/utils/string_util.dart';
import 'package:kids_tracker/vm/track_provider.dart';

import '../core/constant.dart';
import '../core/network/api_client.dart';
import '../core/utils/date_util.dart';
import '../m/setting_result_model.dart';

Future<bool> registerBgHeadlessTask() async {
  // Register flutter_background_geolocation headless task
  return await bg.BackgroundGeolocation.registerHeadlessTask(
      backgroundGeolocationHeadlessTask);
}

@pragma('vm:entry-point')
Future<void> backgroundGeolocationHeadlessTask(
    bg.HeadlessEvent headlessEvent) async {
  print('[BackgroundGeolocation HeadlessTask]: $headlessEvent');
  // Implement a 'case' for only those events you're interested in.
  switch (headlessEvent.name) {
    case bg.Event.HEARTBEAT:
      bg.HeartbeatEvent event = headlessEvent.event;
      print('------ HeartbeatEvent: $event');
      break;
    case bg.Event.TERMINATE:
      bg.State state = headlessEvent.event;
      print('- State: $state');
      break;
    case bg.Event.LOCATION:
      bg.Location location = headlessEvent.event;
      print('- Location: $location');
      break;
    case bg.Event.MOTIONCHANGE:
      bg.Location location = headlessEvent.event;
      print('- Location: $location');
      break;
    case bg.Event.GEOFENCE:
      bg.GeofenceEvent geofenceEvent = headlessEvent.event;
      print('- GeofenceEvent: $geofenceEvent');
      break;
    case bg.Event.GEOFENCESCHANGE:
      bg.GeofencesChangeEvent event = headlessEvent.event;
      print('- GeofencesChangeEvent: $event');
      break;
    case bg.Event.SCHEDULE:
      bg.State state = headlessEvent.event;
      print('- State: $state');
      break;
    case bg.Event.ACTIVITYCHANGE:
      bg.ActivityChangeEvent event = headlessEvent.event;
      print('ActivityChangeEvent: $event');
      break;
    case bg.Event.HTTP:
      bg.HttpEvent response = headlessEvent.event;
      print('HttpEvent: $response');
      break;
    case bg.Event.POWERSAVECHANGE:
      bool enabled = headlessEvent.event;
      print('ProviderChangeEvent: $enabled');
      break;
    case bg.Event.CONNECTIVITYCHANGE:
      bg.ConnectivityChangeEvent event = headlessEvent.event;
      print('ConnectivityChangeEvent: $event');
      break;
    case bg.Event.ENABLEDCHANGE:
      bool enabled = headlessEvent.event;
      print('EnabledChangeEvent: $enabled');
      break;
  }
}

Future<bool> registerBfHeadlessTask() async {
  // Register background_fetch headless task
  return await bf.BackgroundFetch.registerHeadlessTask(
      backgroundFetchHeadlessTask);
}

@pragma('vm:entry-point')
void backgroundFetchHeadlessTask(bf.HeadlessTask task) async {
  String taskId = task.taskId;
  bool isTimeout = task.timeout;
  if (isTimeout) {
    // This task has exceeded its allowed running-time.
    // You must stop what you're doing and immediately .finish(taskId)
    print("[BackgroundFetch] Headless task timed-out: $taskId");
    bf.BackgroundFetch.finish(taskId);
    return;
  }
  print('[BackgroundFetch] Headless event received.');
  // Do your work here...
  bf.BackgroundFetch.finish(taskId);
}

Future<bg.Config> getBackgroundGeolocationConfig(
    WidgetRef ref, SettingModel? setting) async {
  return bg.Config(
    desiredAccuracy: bg.Config.DESIRED_ACCURACY_HIGH,
    distanceFilter: (setting?.distanceFilter ?? 10).toDouble(),
    heartbeatInterval: 60,
    preventSuspend: true,
    enableHeadless: true,
    scheduleUseAlarmManager: true,
    autoSync: true,
    autoSyncThreshold: 10,
    batchSync: true,
    maxBatchSize: 20,
    url: '$LOCATION_URL/geo/locations',
    headers: await ref.read(apiClientProvider).getHeaders(),
    method: 'POST',
    params: {
      'userName': setting?.username ?? '',
      'createdDateTime': DateUtil.getTimeStampISO8601(DateTime.now()),
    },
    schedule: [
      '1-7 ${DateUtil.getShortTimeStr(setting?.startTime ?? '00:00')}-${DateUtil.getShortTimeStr(setting?.endTime ?? '23:59')}',
    ],
    stopOnStationary: false,
    isMoving: true,
    stopOnTerminate: false,
    startOnBoot: true,
    // debug: true,
    logLevel: bg.Config.LOG_LEVEL_VERBOSE,
  );
}

Future<void> startTrackingService(
  WidgetRef ref,
  ValueNotifier<bool> isTrackingTimerRunning,
  ValueNotifier<String> locationInfoString,
  ValueNotifier<int> heartBeatCount,
) async {
  var theSetting = await ref.read(getLocalSettingProvider.future);

  bg.BackgroundGeolocation.ready(
    await getBackgroundGeolocationConfig(ref, theSetting),
  ).then((bg.State state) {
    print('++++++: $state');
    // if (!state.enabled) {
    //   bg.BackgroundGeolocation.start();
    // }

    // Start the Scheduler
    bg.BackgroundGeolocation.startSchedule();
  });

  // Fired whenever a location is recorded
  bg.BackgroundGeolocation.onLocation((bg.Location location) {
    print('------ [location] - ${location.coords}');
    locationInfoString.value = location.coords.toString();
  });

  bg.BackgroundGeolocation.onHeartbeat((bg.HeartbeatEvent event) {
    print('------ [heartbeat] - $event');
    heartBeatCount.value++;
    // bg.BackgroundGeolocation.changePace(true);
  });

  bg.BackgroundGeolocation.onHttp((bg.HttpEvent response) {
    print('------ [http] - $response');
    if (response.status == 200 &&
        response.success &&
        isNotEmpty(response.responseText)) {
      Map<String, dynamic> map = json.decode(response.responseText);
      final newSettingMap = map['value'][0];
      print('------ [new map] - $newSettingMap');
      print('------ [old map] - ${theSetting?.toJson()}');
      final newSetting = SettingModel.fromJson(newSettingMap);
      if (newSetting.toString() != theSetting.toString()) {
        print('------ [different]');
        ref.read(syncSettingProvider(newSetting));
        bg.BackgroundGeolocation.setConfig(bg.Config(
          distanceFilter: (newSetting.distanceFilter ?? 10).toDouble(),
          schedule: [
            '1-7 ${DateUtil.getShortTimeStr(newSetting.startTime ?? '00:00')}-${DateUtil.getShortTimeStr(newSetting.endTime ?? '23:59')}',
          ],
        ));
        theSetting = newSetting;
      }
    }
  });

  bg.BackgroundGeolocation.onSchedule((bg.State state) {
    print('------ [schedule] - $state');
    locationInfoString.value = '';
    heartBeatCount.value = 0;
  });
}

Future<void> stopTrackingService(ValueNotifier<String> locationInfoString,
    ValueNotifier<int> heartBeatCount) async {
  await bg.BackgroundGeolocation.stopSchedule();
  await bg.BackgroundGeolocation.stop();

  locationInfoString.value = '';
  heartBeatCount.value = 0;
}

Future<void> startBackFetchSettingService(WidgetRef ref) async {
  await bf.BackgroundFetch.configure(
    bf.BackgroundFetchConfig(
      minimumFetchInterval: 15,
      stopOnTerminate: false,
      startOnBoot: true,
      enableHeadless: true,
      requiresBatteryNotLow: false,
      requiresCharging: false,
      requiresStorageNotLow: false,
      requiresDeviceIdle: false,
      requiredNetworkType: bf.NetworkType.ANY,
    ),
    (String taskId) async {
      // <-- Event handler
      // This is the fetch-event callback.
      print("------ [BackgroundFetch] Event received $taskId");

      final newSetting = await ref.read(fetchSettingProvider.future);
      if (newSetting != null) {
        final oldSetting = await ref.read(getLocalSettingProvider.future);
        if (oldSetting != null &&
            newSetting.toString() != oldSetting.toString()) {
          await ref.read(syncSettingProvider(newSetting).future);

          // Reconfigure background geolocation regarding new setting
          bg.BackgroundGeolocation.setConfig(bg.Config(
            distanceFilter: (newSetting.distanceFilter ?? 10).toDouble(),
            schedule: [
              '1-7 ${DateUtil.getShortTimeStr(newSetting.startTime ?? '00:00')}-${DateUtil.getShortTimeStr(newSetting.endTime ?? '23:59')}',
            ],
          ));
        }
      }

      // IMPORTANT:  You must signal completion of your task or the OS can punish your app
      // for taking too long in the background.
      bf.BackgroundFetch.finish(taskId);
    },
  );

  bf.BackgroundFetch.start().then((int status) {
    print('------ [BackgroundFetch] start success: $status');
  }).catchError((e) {
    print('------ [BackgroundFetch] start FAILURE: $e');
  });
}

Future<void> stopBackFetchSettingService(ref) async {
  bf.BackgroundFetch.stop().then((int status) {
    print('------ [BackgroundFetch] stop success: $status');
  });
}
