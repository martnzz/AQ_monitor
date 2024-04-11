import 'dart:convert';

import 'package:aq_monitor/features/aq_feature/data/models/get_aq_item_model.dart';
import 'package:http/http.dart' as http;

import '../../../../core/error/exception.dart';

const String apiKey = 'd9e8faf9-f75a-40a8-9d5b-5a7222a1d019';

abstract class GetAqItemDataSource {
  Future<GetAqItemModel> getClosestAqItem();
}

class GetAqItemDataSourceImpl implements GetAqItemDataSource {
  final http.Client client;

  GetAqItemDataSourceImpl({required this.client});

  @override
  Future<GetAqItemModel> getClosestAqItem() async {
    final response = await client.get(
        Uri.parse('https://api.airvisual.com/v2/nearest_city?key=$apiKey'),
        headers: {
          'Content-Type': 'application/json',
        });
    if(response.statusCode==200){
      final item= json.decode(response.body);
      final aqItemModel = GetAqItemModel.fromJson(item);
      print(aqItemModel.data.country);
      print(response.statusCode);
      return aqItemModel;
    }
    else{
      throw ServerException();
    }
  }
}
