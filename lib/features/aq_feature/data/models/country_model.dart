import 'package:aq_monitor/features/aq_feature/domain/entities/countries.dart';

class GetCountriesModel extends CountryItem {
  GetCountriesModel({required super.status, required super.data});

  static GetCountriesModel fromJson(Map<String, dynamic> jsonData) {
    final String status = jsonData['status'];

    final dynamic countryData = jsonData['data'];
    final List<Countries> countries = List<Countries>.from(countryData
        .map((countryData) => Countries(country: countryData['country'])));

    final countryItem = GetCountriesModel(status: status, data: countries);
    return countryItem;
  }
}
