import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../entities/aq_item.dart';
import '../repositories/aq_repository.dart';

class GetSpecifiedAqItem implements UseCase<Item?, Params> {
  final AqItemRepository repository;

  GetSpecifiedAqItem(this.repository);

  @override
  Future<Either<Failure, Item?>> call(Params params) async {
    return await repository.getSpecifiedAqItem(
        params.city, params.country, params.state);
  }
}

class Params extends Equatable {
  final String city;
  final String state;
  final String country;
  const Params(
      {required this.city, required this.country, required this.state});

  @override
  List<Object?> get props => [city, country, state];
}
