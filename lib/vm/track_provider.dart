import 'package:equatable/equatable.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart'
    as bg;
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
import '../m/datasources/remote/setting_api.dart';
import '../m/setting_result_model.dart';

// Add setting - remote
final fetchOrAddDefaultSettingProvider =
    FutureProvider.autoDispose<List<SettingModel>?>((ref) async {
  try {
    final settingApi = ref.read(settingApiProvider);
    final settingResultModel = await settingApi.getSettings();
    if (settingResultModel == null ||
        !(settingResultModel.isSuccess ?? false) ||
        isEmptyList(settingResultModel.value)) {
      final defaultSetting = SettingModel(
        username: ref.read(sessionManagerProvider).getUsername(),
        collectionFrequency: 10,
        pushFrequency: 30,
        distanceFilter: 10,
        accuracy: 'High',
        startTime: '00:00:00',
        endTime: '23:59:00',
      );
      final addSettingResultModel =
          await settingApi.createSetting(defaultSetting);
      if (addSettingResultModel != null &&
          (addSettingResultModel.isSuccess ?? false) &&
          addSettingResultModel.value != null) {
        return [addSettingResultModel.value!];
      }
    } else {
      return settingResultModel.value;
    }
  } catch (e) {
    throw GeneralException(
        code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
  }

  return null;
});

// Fetch setting list - remote
final fetchSettingListProvider =
    FutureProvider.autoDispose<List<SettingModel>?>((ref) async {
  try {
    final settingApi = ref.read(settingApiProvider);
    final settingResultModel = await settingApi.getSettings();
    if (settingResultModel != null &&
        (settingResultModel.isSuccess ?? false) &&
        isNotEmptyList(settingResultModel.value)) {
      return settingResultModel.value;
    }
  } catch (e) {
    throw GeneralException(
        code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
  }

  return null;
});

// Fetch setting list - local
final getLocalSettingProvider = FutureProvider.autoDispose<List<SettingModel>?>(
  (ref) async {
    try {
      final settingLocalDataSource = ref.read(settingLocalDataSourceProvider);
      final username = ref.read(sessionManagerProvider).getUsername();
      final settingHiveModelList =
          await settingLocalDataSource.getSettingList(username: username);
      if (settingHiveModelList != null) {
        // return settingHiveModel.toSettingModel();
        return settingHiveModelList
            .map((settingHiveModel) => settingHiveModel.toSettingModel())
            .toList();
      }
    } catch (e) {
      throw GeneralException(
          code: CODE_SERVICE_UNAVAILABLE, message: e.toString());
    }

    return null;
  },
);

// Sync setting list (add or update) - local
final syncSettingProvider = FutureProvider.autoDispose
    .family<void, List<SettingModel>?>((ref, settingList) async {
  try {
    final settingLocalDataSource = ref.read(settingLocalDataSourceProvider);

    final settingHiveModelList = await settingLocalDataSource.getSettingList(
        username: settingList?.first.username);
    if (settingHiveModelList != null) {
      // Update: delete first
      await settingLocalDataSource.deleteSetting(
          username: settingList?.first.username);
    }
    // Add
    for (var settingModel in settingList!) {
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
    // 检查位置权限状态
    PermissionStatus status = await Permission.location.status;
    print('aaa: $status');

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied) {
      // 请求权限
      status = await Permission.location.request();
      if (status.isDenied) {
        print("位置权限被拒绝");
        // openAppSettings(); // 如果需要，可以提示用户打开设置
      }
    }

    if (status.isPermanentlyDenied) {
      print("位置权限被永久拒绝，请在系统设置中开启权限");
      openAppSettings(); // 打开应用设置页面
    }

    return status.isGranted;
  },
);

class LocationParams extends Equatable {
  const LocationParams({
    required this.username,
    required this.position,
  });

  final String username;
  final bg.Location position;

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
