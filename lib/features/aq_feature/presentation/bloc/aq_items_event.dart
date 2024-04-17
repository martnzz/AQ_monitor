part of 'aq_items_bloc.dart';

abstract class AqItemsEvent extends Equatable {
  const AqItemsEvent();
  @override
  List<Object> get props => [];
}

class GetClosestAqItemEvent extends AqItemsEvent {}

class GetSpecifiedAqItemEvent extends AqItemsEvent {
  final String city;
  final String state;
  final String country;

  const GetSpecifiedAqItemEvent(
      {required this.city, required this.country, required this.state});
}

class GetCountriesEvent extends AqItemsEvent {}

class GetStatesEvent extends AqItemsEvent {
  final String country;

  const GetStatesEvent({required this.country});
}

class GetCitiesEvent extends AqItemsEvent {
  final String country;
  final String state;

  const GetCitiesEvent({required this.country, required this.state});
}
