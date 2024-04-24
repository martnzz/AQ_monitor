import 'package:aq_monitor/features/aq_feature/domain/entities/city.dart';
import 'package:aq_monitor/features/aq_feature/domain/entities/countries.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/aq_item.dart';
import '../entities/state.dart';

abstract class AqItemRepository {
  Future<Either<Failure, Item?>> getClosestAqItem(double lat, double lon);
  Future<Either<Failure, Item?>> getSpecifiedAqItem(
      String city, String country, String state);
  Future<Either<Failure, CountryItem?>> getCountries();
  Future<Either<Failure, StateItem?>> getStates(String country);
  Future<Either<Failure, CityItem?>> getCities(String country, String state);
}
