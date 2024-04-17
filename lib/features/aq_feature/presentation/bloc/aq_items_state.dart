part of 'aq_items_bloc.dart';

abstract class AqItemsState extends Equatable {
  const AqItemsState();

  @override
  List<Object> get props => [];
}

class Empty extends AqItemsState {}

class Loading extends AqItemsState {}

class Loaded extends AqItemsState {
  final Item? item;

  const Loaded({required this.item});

  @override
  List<Object> get props => [item!];
}
class CountriesLoaded extends AqItemsState{
  final CountryItem? country;

  const CountriesLoaded({required this.country});
}

class StatesLoaded extends AqItemsState{
  final StateItem? state;

  const StatesLoaded({required this.state});
}

class CitiesLoaded extends AqItemsState{
  final CityItem? city;

  const CitiesLoaded({required this.city});
}

class Error extends AqItemsState {
  final String message;

  const Error({required this.message});

  @override
  List<Object> get props => [message];
}
