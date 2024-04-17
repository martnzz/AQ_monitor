import 'package:aq_monitor/core/error/failures.dart';
import 'package:aq_monitor/core/network/network_info.dart';
import 'package:aq_monitor/features/aq_feature/domain/entities/aq_item.dart';
import 'package:aq_monitor/features/aq_feature/domain/entities/city.dart';
import 'package:aq_monitor/features/aq_feature/domain/entities/countries.dart';
import 'package:aq_monitor/features/aq_feature/domain/entities/state.dart';
import 'package:aq_monitor/features/aq_feature/domain/repositories/aq_repository.dart';
import 'package:dartz/dartz.dart';

import '../datasource/get_aq_item_data_source.dart';

class GetAqItemRepositoryImpl implements AqItemRepository {
  final GetAqItemDataSource dataSource;
  final NetworkInfo networkInfo;

  GetAqItemRepositoryImpl(
      {required this.dataSource, required this.networkInfo});

  @override
  Future<Either<Failure, Item?>> getClosestAqItem() async {
    try {
      if (await networkInfo.isConnected) {
        final item = await dataSource.getClosestAqItem();
        return Right(item);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Item?>> getSpecifiedAqItem(String city, String country, String state) async {
    try {
      if (await networkInfo.isConnected) {
        final item = await dataSource.getSpecifiedAqItem(city,country,state);
        if(item !=null){
        return Right(item);}
        else {
          return Left(DataFailure());
        }
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CityItem?>> getCities(String country, String state) async {
    try {
      if (await networkInfo.isConnected) {
        final cityItem = await dataSource.getCities(country, state);
        return Right(cityItem);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, CountryItem?>> getCountries() async {
    try {
      if (await networkInfo.isConnected) {
        final countryItem = await dataSource.getCountries();
        return Right(countryItem);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, StateItem?>> getStates(String country) async {
    try {
      if (await networkInfo.isConnected) {
        final stateItem = await dataSource.getStates(country);
        return Right(stateItem);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      return Left(ServerFailure());
    }
  }
}

