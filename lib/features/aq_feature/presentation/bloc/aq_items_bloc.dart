import 'package:aq_monitor/features/aq_feature/domain/entities/countries.dart';
import 'package:aq_monitor/features/aq_feature/domain/usecases/get_countries.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aq_monitor/core/usecases/usecase.dart';
import 'package:aq_monitor/features/aq_feature/domain/usecases/get_closest_aq_item.dart';
import 'package:aq_monitor/features/aq_feature/domain/usecases/get_specified_aq_item.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/aq_item.dart';
import '../../domain/entities/city.dart';
import '../../domain/entities/state.dart';
import '../../domain/usecases/get_cities.dart';
import '../../domain/usecases/get_states.dart';

part 'aq_items_event.dart';
part 'aq_items_state.dart';

class AqItemsBloc extends Bloc<AqItemsEvent, AqItemsState> {
  final GetClosestAqItem getLocalAqItems;
  final GetSpecifiedAqItem getSpecifiedAqItem;
  final GetCountries getCountries;
  final GetStates getStates;
  final GetCities getCities;

  AqItemsBloc({
    required this.getLocalAqItems,
    required this.getSpecifiedAqItem,
    required this.getCountries,
    required this.getStates,
    required this.getCities,
  }) : super(Empty()) {
    on<GetClosestAqItemEvent>((event, emit) async {
      emit(Loading());
      final inputEither = await getLocalAqItems(NoParams());
      inputEither.fold(
        (failure) => emit(Error(message: _mapFailureToMessage(failure).tr())),
        (item) => emit(Loaded(item: item)),
      );
    });

    on<GetSpecifiedAqItemEvent>((event, emit) async {
      emit(Loading());
      final inputEither = await getSpecifiedAqItem(
          Params(city: event.city, country: event.country, state: event.state));
      inputEither.fold(
        (failure) => emit(Error(message: _mapFailureToMessage(failure).tr())),
        (item) => emit(Loaded(item: item)),
      );
    });

    on<GetCountriesEvent>((event, emit) async {
      emit(Loading());
      final inputEither = await getCountries(NoParams());
      inputEither.fold(
          (failure) => emit(Error(message: _mapFailureToMessage(failure).tr())),
          (countryItem) => emit(CountriesLoaded(country: countryItem)));
    });

    on<GetStatesEvent>((event, emit) async {
      emit(Loading());
      final inputEither = await getStates(StateParams(country: event.country));
      inputEither.fold(
          (failure) => emit(Error(message: _mapFailureToMessage(failure).tr())),
          (stateItem) => emit(StatesLoaded(state: stateItem)));
    });

    on<GetCitiesEvent>((event, emit) async {
      emit(Loading());
      final inputEither = await getCities(CityParams(country: event.country, state: event.state));
      inputEither.fold(
              (failure) => emit(Error(message: _mapFailureToMessage(failure).tr())),
              (cityItem) => emit(CitiesLoaded(city: cityItem)));
    });
  }
  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case const (NetworkFailure):
        return networkFailureMessage;
      case const (ServerFailure):
        return serverFailureMessage;
      case const (DataFailure):
        return dataFailureMessage;
      default:
        return 'unexpected_error';
    }
  }
}

const String networkFailureMessage = 'no_connection';
const String serverFailureMessage = 'server_error';
const String dataFailureMessage = 'data_error';
