import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/aq_item.dart';
import '../repositories/aq_repository.dart';


class GetClosestAqItem implements UseCase<Item?, NoParams> {
  final AqItemRepository repository;

  GetClosestAqItem(this.repository);

  @override
  Future<Either<Failure, Item?>> call(NoParams noParams) async {
    return await repository.getClosestAqItem();
  }
}
