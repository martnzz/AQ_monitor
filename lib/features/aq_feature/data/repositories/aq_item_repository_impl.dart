import 'package:aq_monitor/core/error/failures.dart';
import 'package:aq_monitor/core/network/network_info.dart';
import 'package:aq_monitor/features/aq_feature/domain/entities/aq_item.dart';
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
        print(item.data.country);
        return Right(item);
      } else {
        return Left(NetworkFailure());
      }
    } catch (e) {
      print(e);

      return Left(ServerFailure());
    }
  }
}
