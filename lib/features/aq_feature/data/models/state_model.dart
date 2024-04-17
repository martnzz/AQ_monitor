import '../../domain/entities/state.dart';

class GetStateModel extends StateItem {
  GetStateModel({required super.status, required super.data});

  static GetStateModel fromJson(Map<String, dynamic> jsonData) {
    final String status = jsonData['status'];

    final dynamic stateData = jsonData['data'];
    final List<States> states = List<States>.from(stateData.map((stateJson) => States(state: stateJson['state'])));

    final stateItem = GetStateModel(status: status, data: states);
    return stateItem;
  }
}
