import 'package:aq_monitor/core/network/network_info.dart';
import 'package:aq_monitor/features/aq_feature/data/datasource/get_aq_item_data_source.dart';
import 'package:aq_monitor/features/aq_feature/data/repositories/aq_item_repository_impl.dart';
import 'package:aq_monitor/features/aq_feature/domain/usecases/get_aq_item.dart';
import 'package:aq_monitor/features/aq_feature/presentation/bloc/aq_items_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import '../features/aq_feature/domain/repositories/aq_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // bloc
  sl.registerFactory(() => AqItemsBloc(getLocalAqItems: sl()));

  // repository
  sl.registerLazySingleton<AqItemRepository>(
    () => GetAqItemRepositoryImpl(dataSource: sl(), networkInfo: sl()),
  );

  // use case
  sl.registerLazySingleton(() => GetClosestAqItem(sl()));

  // data source
  sl.registerLazySingleton<GetAqItemDataSource>(
      () => GetAqItemDataSourceImpl(client: sl()));

  // core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl()));

  // external
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => http.Client());
}
