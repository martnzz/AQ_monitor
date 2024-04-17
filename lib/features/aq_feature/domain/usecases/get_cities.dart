import 'package:aq_monitor/features/aq_feature/domain/entities/city.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/aq_repository.dart';


class GetCities implements UseCase<CityItem?, CityParams> {
  final AqItemRepository repository;

  GetCities(this.repository);

  @override
  Future<Either<Failure, CityItem?>> call(CityParams params) async {
    return await repository.getCities(params.country,params.state);
  }
}
class CityParams extends Equatable {
  final String country;
  final String state;
  const CityParams({required this.country,required this.state});

  @override
  List<Object?> get props => [country,state];
}