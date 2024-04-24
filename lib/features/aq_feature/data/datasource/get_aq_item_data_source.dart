import 'dart:convert';

import 'package:aq_monitor/features/aq_feature/data/models/get_aq_item_model.dart';
import 'package:aq_monitor/features/aq_feature/data/models/state_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';
import '../models/city_model.dart';
import '../models/country_model.dart';

const String apiKey = 'd9e8faf9-f75a-40a8-9d5b-5a7222a1d019';

abstract class GetAqItemDataSource {
  Future<GetAqItemModel?> getClosestAqItem(double lan, double lon);
  Future<GetAqItemModel?> getSpecifiedAqItem(
      String city, String country, String state);
  Future<GetCountriesModel> getCountries();
  Future<GetStateModel> getStates(String country);
  Future<GetCityModel?> getCities(String country, String state);
}

class GetAqItemDataSourceImpl implements GetAqItemDataSource {
  final http.Client client;

  GetAqItemDataSourceImpl({required this.client});

  @override
  Future<GetAqItemModel?> getClosestAqItem(double lat, double lon) async {
    final response = await client.get(
        Uri.parse(
            'http://api.airvisual.com/v2/nearest_city?lat=$lat&lon=$lon&key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      final aqItemModel = GetAqItemModel.fromJson(item);
      return aqItemModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GetAqItemModel?> getSpecifiedAqItem(
      String city, String country, String state) async {
    final response = await client.get(
        Uri.parse(
            'http://api.airvisual.com/v2/city?city=$city&state=$state&country=$country&key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      final aqItemModel = GetAqItemModel.fromJson(item);
      return aqItemModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GetCityModel?> getCities(String country, String state) async {
    final response = await client.get(
        Uri.parse(
            'http://api.airvisual.com/v2/cities?state=$state&country=$country&key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      final aqCitiesModel = GetCityModel.fromJson(item);
      return aqCitiesModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GetCountriesModel> getCountries() async {
    final response = await client.get(
        Uri.parse('http://api.airvisual.com/v2/countries?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      final aqCountriesModel = GetCountriesModel.fromJson(item);
      return aqCountriesModel;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<GetStateModel> getStates(String country) async {
    final response = await client.get(
        Uri.parse(
            'http://api.airvisual.com/v2/states?country=$country&key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        });
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      final aqStatesModel = GetStateModel.fromJson(item);
      return aqStatesModel;
    } else {
      throw ServerException();
    }
  }


}
