import 'package:aq_monitor/features/aq_feature/domain/entities/state.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/aq_repository.dart';

class GetStates implements UseCase<StateItem?, StateParams> {
  final AqItemRepository repository;

  GetStates(this.repository);

  @override
  Future<Either<Failure, StateItem?>> call(StateParams params) async {
    return await repository.getStates(params.country);
  }
}

class StateParams extends Equatable {
  final String country;
  const StateParams({required this.country});

  @override
  List<Object?> get props => [country];
}
