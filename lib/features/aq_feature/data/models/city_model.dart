import 'package:aq_monitor/features/aq_feature/domain/entities/city.dart';

class GetCityModel extends CityItem {
  GetCityModel({required super.status, required super.data});

  static GetCityModel? fromJson(Map<String, dynamic> jsonData) {
    final String status = jsonData['status'];

    final dynamic cityData = jsonData['data'];
    if (status == 'fail') {
      return null;
    } else {
      final List<Cities> cities = List<Cities>.from(
          cityData.map((cityJson) => Cities(city: cityJson['city'])));
      final cityItem = GetCityModel(status: status, data: cities);
      return cityItem;
    }
  }
}
