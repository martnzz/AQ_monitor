part of 'aq_items_bloc.dart';

abstract class AqItemsEvent extends Equatable {
  const AqItemsEvent();
  @override
  List<Object> get props => [];
}

class GetClosestAqItemEvent extends AqItemsEvent {}

