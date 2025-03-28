import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kids_tracker/core/utils/string_util.dart';
import 'package:kids_tracker/m/datasources/local/location_local_data_source.dart';
import 'package:permission_handler/permission_handler.dart';

import '../core/constant.dart';
import '../core/db/location_hive_model.dart';
import '../core/db/setting_hive_model.dart';
import '../core/general_exception.dart';
import '../core/session_manager.dart';
import '../m/datasources/local/setting_local_data_source.dart';
import '../m/datasources/remote/location_api.dart';
import '../m/datasources/remote/setting_api.dart';
import '../m/setting_result_model.dart';

// Add setting - remote
final fetchOrAddDefaultSettingProvider =
    FutureProvider.autoDispose<SettingModel?>((ref) async {
  try {
    final settingApi = ref.read(settingApiProvider);
    final settingResultModel = await settingApi.getSettings();
    if (settingResultModel == null ||
        !(settingResultModel.isSuccess ?? false) ||
        isEmptyList(settingResultModel.value)) {
      final defaultSetting = SettingModel(
        id: 0,
        username: ref.read(sessionManagerProvider).getUsername(),
        collectionFrequency: 10,
        pushFrequency: 30,
        distanceFilter: 10,
        startTime: '00:00:00',
        endTime: '23:59:00',
      );
      final addSettingResultModel =
          await settingApi.createSetting(defaultSetting);
      if (addSettingResultModel != null &&
          (addSettingResultModel.isSuccess ?? false) &&
          addSettingResultModel.value != null) {
        return addSettingResultModel.value;
      }
    } else {
      return settingResultModel.value?.first;
    }
  } catch (e) {
    throw GeneralException(
        code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
  }

  return null;
});

// Fetch setting - remote
final fetchSettingProvider =
    FutureProvider.autoDispose<SettingModel?>((ref) async {
  try {
    final settingApi = ref.read(settingApiProvider);
    final settingResultModel = await settingApi.getSettings();
    if (settingResultModel != null &&
        (settingResultModel.isSuccess ?? false) &&
        isNotEmptyList(settingResultModel.value)) {
      return settingResultModel.value?.first;
    }
  } catch (e) {
    throw GeneralException(
        code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
  }

  return null;
});

// Fetch setting - local
final getLocalSettingProvider = FutureProvider.autoDispose<SettingModel?>(
  (ref) async {
    try {
      final settingLocalDataSource = ref.read(settingLocalDataSourceProvider);
      final username = ref.read(sessionManagerProvider).getUsername();
      final settingHiveModel =
          await settingLocalDataSource.getSetting(username: username);
      if (settingHiveModel != null) {
        return settingHiveModel.toSettingModel();
      }
    } catch (e) {
      throw GeneralException(
          code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
    }

    return null;
  },
);

// Sync setting (add or update) - local
final syncSettingProvider = FutureProvider.autoDispose
    .family<void, SettingModel>((ref, settingModel) async {
  try {
    final settingLocalDataSource = ref.read(settingLocalDataSourceProvider);

    final settingHiveModel = await settingLocalDataSource.getSetting(
        username: settingModel.username);
    if (settingHiveModel != null) {
      await settingLocalDataSource.updateSetting(settingModel);
    } else {
      await settingLocalDataSource
          .addSetting(SettingHiveModel.fromSettingModel(settingModel));
    }
  } catch (e) {
    throw GeneralException(
        code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
  }
});

final requestLocationPermissionProvider = FutureProvider.autoDispose<bool>(
  (ref) async {
    LocationPermission permission = await Geolocator.checkPermission();
    print('aaa: $permission');
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      return true;
    }
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("位置权限被拒绝");
        // openAppSettings();
      }
    }
    if (permission == LocationPermission.deniedForever) {
      print("位置权限被永久拒绝，请在系统设置中开启权限");
      openAppSettings();
    }

    return false;
  },
);

class LocationParams extends Equatable {
  const LocationParams({
    required this.username,
    required this.position,
  });

  final String username;
  final Position position;

  @override
  List<Object?> get props => [username, position];
}

// Add a location - local
final addLocationProvider =
    FutureProvider.autoDispose.family<void, LocationParams>(
  (ref, locationParams) async {
    try {
      final locationLocalDataSource = ref.read(locationLocalDataSourceProvider);
      await locationLocalDataSource.addLocation(LocationHiveModel.fromPosition(
          locationParams.position, locationParams.username));
    } catch (e) {
      throw GeneralException(
          code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
    }
  },
);

// Fetch all locations of a user - local
final fetchLocationsProvider =
    FutureProvider.autoDispose.family<List<LocationHiveModel>, String?>(
  (ref, username) async {
    try {
      final locationLocalDataSource = ref.read(locationLocalDataSourceProvider);
      return await locationLocalDataSource.getLocations(username: username);
    } catch (e) {
      throw GeneralException(
          code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
    }
  },
);

// Delete all locations of a user - local
final deleteLocationsProvider =
    FutureProvider.autoDispose.family<void, String?>(
  (ref, username) async {
    try {
      final locationLocalDataSource = ref.read(locationLocalDataSourceProvider);
      await locationLocalDataSource.deleteLocations(username: username);
    } catch (e) {
      throw GeneralException(
          code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
    }
  },
);

// Send locations to server and delete them locally
final syncLocationsProvider =
    FutureProvider.autoDispose.family<void, String?>((ref, username) async {
  try {
    final locationLocalDataSource = ref.read(locationLocalDataSourceProvider);
    final locationApi = ref.read(locationProvider);

    final locations =
        await locationLocalDataSource.getLocations(username: username);
    if (locations.isNotEmpty) {
      final settingResultModel = await locationApi.sendLocations(locations);
      if (settingResultModel != null &&
          settingResultModel.isSuccess == true &&
          isNotEmptyList(settingResultModel.value)) {
        final setting = settingResultModel.value!.first;
        // Sync the setting to local db
        await ref.read(syncSettingProvider(setting).future);
        // Delete the locations if they are successfully sent to the server
        await locationLocalDataSource.deleteLocations(username: username);
      }
    }
  } catch (e) {
    throw GeneralException(
        code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
  }
});
