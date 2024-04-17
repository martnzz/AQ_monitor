
import 'package:aq_monitor/features/aq_feature/domain/entities/countries.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/aq_repository.dart';

class GetCountries implements UseCase<CountryItem?, NoParams> {
  final AqItemRepository repository;

  GetCountries(this.repository);

  @override
  Future<Either<Failure, CountryItem?>> call(NoParams noParams) async {
    return await repository.getCountries();
  }
}
