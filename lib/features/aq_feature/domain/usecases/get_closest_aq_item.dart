import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/aq_item.dart';
import '../repositories/aq_repository.dart';

class GetClosestAqItem implements UseCase<Item?, CloseParams> {
  final AqItemRepository repository;

  GetClosestAqItem(this.repository);

  @override
  Future<Either<Failure, Item?>> call(CloseParams params) async {
    return await repository.getClosestAqItem(params.lat, params.lon);
  }
}

class CloseParams extends Equatable {
  final double lat;
  final double lon;
  const CloseParams({required this.lat, required this.lon});

  @override
  List<Object?> get props => [lat, lon];
}
