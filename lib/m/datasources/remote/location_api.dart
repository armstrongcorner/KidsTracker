import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/constant.dart';
import '../../../core/db/location_hive_model.dart';
import '../../../core/network/api_client.dart';
import '../../setting_result_model.dart';

final locationProvider = Provider.autoDispose<LocationApi>(
    (ref) => LocationApi(apiClient: ref.read(apiClientProvider)));

class LocationApi {
  final ApiClient apiClient;
  LocationApi({required this.apiClient});

  Future<SettingResultModel?> sendLocations(
      List<LocationHiveModel> locationModelList,
      {Map<String, String>? headers}) async {
    final List<Map<String, dynamic>> paramLocationList =
        locationModelList.map((hiveModel) {
      return {
        'userName': hiveModel.username,
        'latitude': hiveModel.latitude.toString(),
        'longitude': hiveModel.longitude.toString(),
        'speed': hiveModel.speed.toString(),
        'direction': hiveModel.direction.toString(),
        'dateTimeOcurred': hiveModel.dateTimeOcurred.toString(),
        'createdDateTime': DateTime.now().millisecondsSinceEpoch.toString(),
      };
    }).toList();

    var res = await apiClient.post(
      '/geo/locations',
      paramLocationList,
      myBaseUrl: LOCATION_URL,
      headers: headers,
    );
    var settingResultModel = SettingResultModel.fromJson(res);
    return settingResultModel;
  }
}
