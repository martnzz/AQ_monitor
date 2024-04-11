import 'package:aq_monitor/core/usecases/usecase.dart';
import 'package:aq_monitor/features/aq_feature/domain/usecases/get_aq_item.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/aq_item.dart';

part 'aq_items_event.dart';
part 'aq_items_state.dart';

class AqItemsBloc extends Bloc<AqItemsEvent, AqItemsState> {
  final GetClosestAqItem getLocalAqItems;

  AqItemsBloc({required this.getLocalAqItems}) : super(Empty()) {
    on<GetClosestAqItemEvent>((event, emit) async {
      emit(Loading());
      final inputEither = await getLocalAqItems(NoParams());
      inputEither.fold((failure) {
        emit(Error(message: failure.toString()));
        print('aaaaaaaaaaaasddd');
      }, (item) {
        emit(Loaded(item: item));
        print('aaadddsss');
      });
    });
  }
}
