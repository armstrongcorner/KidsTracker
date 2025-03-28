import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constant.dart';
import '../../../core/network/api_client.dart';
import '../../setting_result_model.dart';

final settingApiProvider = Provider.autoDispose<SettingApi>(
    (ref) => SettingApi(apiClient: ref.read(apiClientProvider)));

class SettingApi {
  final ApiClient apiClient;
  SettingApi({required this.apiClient});

  Future<SettingResultModel?> getSettings(
      {Map<String, String>? headers}) async {
    var res = await apiClient.get(
      '/geo/settings',
      myBaseUrl: LOCATION_URL,
      headers: headers,
    );
    var settingResultModel = SettingResultModel.fromJson(res);
    return settingResultModel;
  }

  Future<AddSettingResultModel?> createSetting(SettingModel settingModel,
      {Map<String, String>? headers}) async {
    var res = await apiClient.post(
      '/geo/setting/create',
      settingModel.toJson(),
      myBaseUrl: LOCATION_URL,
      headers: headers,
    );
    var addSettingResultModel = AddSettingResultModel.fromJson(res);
    return addSettingResultModel;
  }
}
