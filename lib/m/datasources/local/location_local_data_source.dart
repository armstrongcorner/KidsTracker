import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constant.dart';
import '../../../core/db/local_storage.dart';
import '../../../core/db/location_hive_model.dart';
import '../../../core/session_manager.dart';
import '../../../core/utils/string_util.dart';

final locationLocalDataSourceProvider =
    Provider((ref) => LocationLocalDataSource(ref));

class LocationLocalDataSource {
  LocationLocalDataSource(this._ref);

  final Ref _ref;

  late final WSLocalStorage storage = _ref.read(localStorageProvider);
  late final SessionManager sessionManager = _ref.read(sessionManagerProvider);

  Future<List<LocationHiveModel>> getLocations({String? username}) async {
    final Box<LocationHiveModel> locationBox =
        await storage.openBox<LocationHiveModel>(BOX_NAME_LOCATION);
    if (isNotEmpty(username)) {
      return locationBox.values
          .where((element) => element.username == username)
          .toList();
    } else {
      return locationBox.values.toList();
    }
  }

  Future<void> deleteLocations({String? username}) async {
    final Box<LocationHiveModel> locationBox =
        await storage.openBox<LocationHiveModel>(BOX_NAME_LOCATION);
    if (isNotEmpty(username)) {
      final tobeDeleteKeys = locationBox.values
          .where((element) => element.username == username)
          .toList()
          .map((item) => item.key);
      await locationBox.deleteAll(tobeDeleteKeys);
    } else {
      await locationBox.clear();
    }
  }

  Future<void> addLocation(LocationHiveModel locationHiveModel) async {
    final Box<LocationHiveModel> locationBox =
        await storage.openBox<LocationHiveModel>(BOX_NAME_LOCATION);
    await locationBox.add(locationHiveModel);
  }

  Future<void> updateLocation(LocationHiveModel locationHiveModel) async {
    final Box<LocationHiveModel> locationBox =
        await storage.openBox<LocationHiveModel>(BOX_NAME_LOCATION);
    await locationBox.put(locationHiveModel.key, locationHiveModel);
  }

  Future<void> searchLocationBy() async {}
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
