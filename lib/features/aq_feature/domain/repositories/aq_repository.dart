import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/aq_item.dart';

abstract class AqItemRepository{
  Future<Either<Failure,Item?>> getClosestAqItem();
}