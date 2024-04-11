import 'package:aq_monitor/features/aq_feature/domain/entities/aq_item.dart';

class GetAqItemModel extends Item{
  const GetAqItemModel({required super.status, required super.data});

  static GetAqItemModel fromJson(Map<String,dynamic>jsonData){
    final String status=jsonData['status'];

    final dynamic locationData = jsonData['data']['location'];
    final Location aqLocation = Location(
      type: locationData['type'],
      coordinates: List<double>.from(locationData['coordinates']),
    );


    final dynamic currentData = jsonData['data']['current'];
    final Current aqCurrent = Current(
      pollution: Pollution(
        ts: currentData['pollution']['ts'],
        aqius: currentData['pollution']['aqius'],
        mainus: currentData['pollution']['mainus'],
        aqicn: currentData['pollution']['aqicn'],
        maincn: currentData['pollution']['maincn'],
      ),
      weather: Weather(
        ts: currentData['weather']['ts'],
        tp: currentData['weather']['tp'],
        pr: currentData['weather']['pr'],
        hu: currentData['weather']['hu'],
        ws: currentData['weather']['ws'],
        wd: currentData['weather']['wd'],
        ic: currentData['weather']['ic'],
      ),
    );


    final dynamic data = jsonData['data'];
    final Data aqData = Data(
      city: data['city'],
      state: data['state'],
      country: data['country'],
      location: aqLocation,
      current: aqCurrent,
    );

    final item = GetAqItemModel(status: status, data: aqData);
    return item;
  }
}
