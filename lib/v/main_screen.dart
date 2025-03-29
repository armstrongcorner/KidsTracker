import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids_tracker/core/utils/string_util.dart';

import '../core/route/app_route.dart';
import '../core/session_manager.dart';
import '../core/use_l10n.dart';
import '../vm/location_tracker.dart';
import '../vm/track_provider.dart';
import 'common_widgets/simple_dialog_content.dart';
import 'common_widgets/toast.dart';

class MainScreen extends HookConsumerWidget {
  MainScreen({super.key});

  Timer? _foregroundLocationTimer;
  Timer? _foregroundSyncTimer;
  Timer? _foregroundTrackingServiceTimer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isTracking = useState(false);
    final isTrackingTimerRunning = useState(false);

    final locationInfoString = useState('');
    final heartBeatCount = useState(0);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () async {
              EasyLoading.show(
                maskType: EasyLoadingMaskType.clear,
              );
              final settingList =
                  await ref.read(getLocalSettingProvider.future);
              print('aaaaaa: ${settingList.toString()}');
              EasyLoading.dismiss();

              if (isNotEmptyList(settingList)) {
                WSToast.show(
                  'setting list: ${settingList.toString()}',
                );
              } else {
                WSToast.show('no setting');
              }
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              showCustomSizeDialog(
                context,
                barrierDismissible: true,
                child: SimpleDialogContent(
                  bodyText: useL10n(theContext: context).confirmLogoutTip,
                  cancelBtnText: useL10n(theContext: context).cancel,
                  okBtnText: useL10n(theContext: context).ok,
                  onClickOK: () async {
                    // Stop service first
                    EasyLoading.show(
                      maskType: EasyLoadingMaskType.clear,
                    );

                    isTracking.value = !isTracking.value;

                    _foregroundLocationTimer?.cancel();
                    _foregroundSyncTimer?.cancel();
                    _foregroundTrackingServiceTimer?.cancel();
                    isTrackingTimerRunning.value = false;

                    stopTrackingService(
                      locationInfoString,
                      heartBeatCount,
                    );

                    stopBackFetchSettingService(ref);

                    EasyLoading.dismiss();

                    // Back to login page
                    final appRoute = ref.read(appRouterProvider);
                    final sessionManager = ref.read(sessionManagerProvider);
                    sessionManager.logout(keepUsername: false);
                    appRoute.go(RouteURL.login);
                  },
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            // Debug info
            Container(
              width: 300.w,
              height: 200.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Location: ${locationInfoString.value}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Heartbeat: ${heartBeatCount.value}',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                    ),
                  ),
                ],
              ),
            ),

            InkWell(
              onTap: () async {
                if (!isTracking.value) {
                  final isGranted =
                      await ref.read(requestLocationPermissionProvider.future);
                  if (isGranted) {
                    EasyLoading.show(
                      maskType: EasyLoadingMaskType.clear,
                    );

                    final settingList =
                        await ref.read(fetchOrAddDefaultSettingProvider.future);
                    print(settingList);
                    if (isNotEmptyList(settingList)) {
                      // Sync remote setting to local db
                      await ref.read(syncSettingProvider(settingList).future);

                      // _startCheckTrackingService(ref, isTrackingTimerRunning);
                      startTrackingService(
                        ref,
                        isTrackingTimerRunning,
                        locationInfoString,
                        heartBeatCount,
                      );

                      startBackFetchSettingService(ref);
                    } else {
                      EasyLoading.showError('fetch setting failed');
                    }

                    isTracking.value = !isTracking.value;
                    EasyLoading.dismiss();
                  }
                } else {
                  EasyLoading.show(
                    maskType: EasyLoadingMaskType.clear,
                  );

                  isTracking.value = !isTracking.value;

                  _foregroundLocationTimer?.cancel();
                  _foregroundSyncTimer?.cancel();
                  _foregroundTrackingServiceTimer?.cancel();
                  isTrackingTimerRunning.value = false;

                  stopTrackingService(
                    locationInfoString,
                    heartBeatCount,
                  );

                  stopBackFetchSettingService(ref);

                  EasyLoading.dismiss();

                  WSToast.show(useL10n(theContext: context).stopTracking);
                }
              },
              child: Container(
                width: 150.w,
                height: 60.h,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 15, 104, 104),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isTracking.value
                      ? useL10n().stopBtnTitle
                      : useL10n().startBtnTitle,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // // 前台定时采集位置并上传（运行后立即执行第一次）
  // Future<void> _startForegroundLocationTracking(WidgetRef ref) async {
  //   // Get setting from local db
  //   final setting = await ref.read(getLocalSettingProvider.future);
  //   print("间隔${setting?.collectionFrequency}秒获取一次位置");

  //   _retrieveAndCacheLocation(ref);

  //   _foregroundLocationTimer?.cancel();

  //   var newInterval = Duration(seconds: setting?.collectionFrequency ?? 0);
  //   _foregroundLocationTimer = Timer.periodic(newInterval, (timer) {
  //     print("执行任务: ${timer.tick}");
  //     _startForegroundLocationTracking(ref);
  //   });
  // }

  // void _retrieveAndCacheLocation(WidgetRef ref) async {
  //   try {
  //     final currentUsername = ref.read(sessionManagerProvider).getUsername();
  //     final LocationSettings locationSettings = LocationSettings(
  //       accuracy: LocationAccuracy.best,
  //     );

  //     Position position = await Geolocator.getCurrentPosition(
  //         locationSettings: locationSettings);
  //     print("前台位置：$position");

  //     // Cache location to local db
  //     ref.read(addLocationProvider(
  //             LocationParams(username: currentUsername, position: position))
  //         .future);
  //   } catch (e) {
  //     print("前台获取位置错误：$e");
  //   }
  // }

  // // 前台定时同步位置数据到服务器（运行后等待间隔后执行第一次）
  // Future<void> _startForegroundSyncLocation(WidgetRef ref) async {
  //   // Get setting from local db
  //   final setting = await ref.read(getLocalSettingProvider.future);
  //   print("间隔${setting?.pushFrequency}秒同步一次位置");

  //   _foregroundSyncTimer?.cancel();

  //   var newInterval = Duration(seconds: setting?.pushFrequency ?? 0);
  //   _foregroundSyncTimer = Timer.periodic(newInterval, (timer) async {
  //     print("同步位置数据: ${timer.tick}");
  //     await ref.read(syncLocationsProvider(setting?.username).future);

  //     _startForegroundSyncLocation(ref);
  //   });
  // }

  // Future<void> _startCheckTrackingService(
  //     WidgetRef ref, ValueNotifier<bool> isTrackingTimerRunning) async {
  //   _foregroundTrackingServiceTimer?.cancel();

  //   _compareSettingToRun(ref, isTrackingTimerRunning);

  //   var newInterval = Duration(minutes: 1);
  //   _foregroundTrackingServiceTimer = Timer.periodic(newInterval, (timer) {
  //     print("检查是否在时间范围内需要运行: ${timer.tick}");
  //     _compareSettingToRun(ref, isTrackingTimerRunning);
  //   });
  // }

  // Future<void> _compareSettingToRun(
  //     WidgetRef ref, ValueNotifier<bool> isTrackingTimerRunning) async {
  //   // Get setting from local db
  //   final settingModel = await ref.read(getLocalSettingProvider.future);
  //   final startTimeComponent =
  //       (settingModel?.startTime ?? '00:00:00').split(':');
  //   final startTimeInSec = int.parse(startTimeComponent[0]) * 3600 +
  //       int.parse(startTimeComponent[1]) * 60 +
  //       int.parse(startTimeComponent[2]);
  //   final endTimeComponent = (settingModel?.endTime ?? '00:00:00').split(':');
  //   final endTimeInSec = int.parse(endTimeComponent[0]) * 3600 +
  //       int.parse(endTimeComponent[1]) * 60 +
  //       int.parse(endTimeComponent[2]);
  //   final now = DateTime.now();
  //   final nowInSec = now.hour * 3600 + now.minute * 60 + now.second;
  //   // Compare the current time with the setting time
  //   if (nowInSec >= startTimeInSec && nowInSec <= endTimeInSec) {
  //     print('在时间范围内');
  //     if (!isTrackingTimerRunning.value) {
  //       print('开始运行');
  //       // Start foreground location tracking with the setting interval
  //       _startForegroundLocationTracking(ref);
  //       // Start foreground sync location to server with the setting interval
  //       _startForegroundSyncLocation(ref);

  //       isTrackingTimerRunning.value = true;
  //     } else {
  //       print('已经在运行 - 不需要再次运行');
  //     }
  //   } else {
  //     print('不在时间范围内，停止运行');
  //     _foregroundLocationTimer?.cancel();
  //     _foregroundSyncTimer?.cancel();
  //     isTrackingTimerRunning.value = false;

  //     final setting = await ref.read(fetchSettingProvider.future);
  //     if (setting != null) {
  //       // Sync remote setting to local db
  //       await ref.read(syncSettingProvider(setting).future);
  //     }
  //   }
  // }
}
