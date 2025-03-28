import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:collection/collection.dart';
import 'package:kids_tracker/m/setting_result_model.dart';

import '../../../core/constant.dart';
import '../../../core/db/local_storage.dart';
import '../../../core/db/setting_hive_model.dart';
import '../../../core/session_manager.dart';
import '../../../core/utils/string_util.dart';

final settingLocalDataSourceProvider =
    Provider((ref) => SettingLocalDataSource(ref));

class SettingLocalDataSource {
  SettingLocalDataSource(this._ref);

  final Ref _ref;

  late final WSLocalStorage storage = _ref.read(localStorageProvider);
  late final SessionManager sessionManager = _ref.read(sessionManagerProvider);

  Future<SettingHiveModel?> getSetting({String? username}) async {
    final Box<SettingHiveModel> settingBox =
        await storage.openBox<SettingHiveModel>(BOX_NAME_SETTING);
    if (isNotEmpty(username)) {
      return settingBox.values
          .firstWhereOrNull((element) => element.userName == username);
    } else {
      return null;
    }
  }

  Future<void> deleteSetting({String? username}) async {
    final Box<SettingHiveModel> settingBox =
        await storage.openBox<SettingHiveModel>(BOX_NAME_SETTING);
    if (isNotEmpty(username)) {
      final tobeDeleteKeys = settingBox.values
          .where((element) => element.userName == username)
          .toList()
          .map((item) => item.key);
      await settingBox.deleteAll(tobeDeleteKeys);
    } else {
      await settingBox.clear();
    }
  }

  Future<void> addSetting(SettingHiveModel settingHiveModel) async {
    final Box<SettingHiveModel> settingBox =
        await storage.openBox<SettingHiveModel>(BOX_NAME_SETTING);
    await settingBox.add(settingHiveModel);
  }

  Future<void> updateSetting(SettingModel settingModel) async {
    final Box<SettingHiveModel> settingBox =
        await storage.openBox<SettingHiveModel>(BOX_NAME_SETTING);
    final settingHiveModel = settingBox.values
        .firstWhere((element) => element.userName == settingModel.username);
    settingHiveModel.userName = settingModel.username;
    settingHiveModel.collectionFrequency = settingModel.collectionFrequency;
    settingHiveModel.pushFrequency = settingModel.pushFrequency;
    settingHiveModel.distanceFilter = settingModel.distanceFilter;
    settingHiveModel.startTime = settingModel.startTime;
    settingHiveModel.endTime = settingModel.endTime;

    await settingBox.put(settingHiveModel.key, settingHiveModel);
  }

  Future<void> searchSettingBy() async {}
  // Future<void> saveAccount(AuthorizationModel authModel,
  //     AccountModel accountModel, OrganizationModel organizationModel) async {
  //   final String region = sessionManager.getDeviceRegion();
  //   final AccountHiveModel accountHiveModel = combineAccountHiveModel(
  //       authModel, accountModel, organizationModel, region);
  //   sessionManager.updateAccountDetail(accountHiveModel);
  //   await saveAccountHiveModel(accountHiveModel);
  // }

  // Future<void> saveAccountHiveModel(AccountHiveModel accountHiveModel) async {
  //   final Box<AccountHiveModel> accountBox =
  //       storage.box<AccountHiveModel>(BoxKeys.BOX_NAME_ACCOUNTS);

  //   /// Find if login account existed in DB;
  //   AccountHiveModel? findAccountInDB;
  //   try {
  //     findAccountInDB = accountBox.values.firstWhere(
  //         (AccountHiveModel item) => item.id == accountHiveModel.id);
  //   } on StateError {
  //     findAccountInDB = null;
  //   }

  //   /// Delete account if it exist in DB
  //   if (findAccountInDB != null) {
  //     findAccountInDB.delete();
  //   }

  //   /// Update or create account in DB
  //   sessionManager.updateAccountDetail(accountHiveModel);
  //   await accountBox.add(accountHiveModel);
  //   Log.d('LoginLocalDataSourceImpl', 'save account in local data');
  // }

  // Future<List<AccountHiveModel>> getAccountsByRegion(Region region) {
  //   final EBDbBox<AccountHiveModel> accountBox =
  //       storage.box<AccountHiveModel>(BoxKeys.BOX_NAME_ACCOUNTS);
  //   final List<AccountHiveModel> accounts = accountBox.values
  //       .where((account) => account.region == region.toString())
  //       .toList();
  //   return Future.value(accounts);
  // }
}
