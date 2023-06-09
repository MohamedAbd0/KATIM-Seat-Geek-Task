import 'package:get_it/get_it.dart';
import 'package:katim_task/data/datasource/online/event_remote_datasource.dart';
import 'package:katim_task/data/repositories/online_repository_impl.dart';
import 'package:katim_task/domain/usecases/favorites.dart';
import 'package:katim_task/domain/usecases/get_events.dart';

import 'data/datasource/offline/event_offline_datasource.dart';
import 'data/repositories/offline_repository_impl.dart';
import 'domain/repositories/online_repository.dart';
import 'domain/repositories/offline_repository.dart';
import 'presentation/cubits/local_events/local_events_cubit.dart';
import 'presentation/cubits/remote_events/remote_events_cubit.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator
      .registerFactory<RemoteEventsCubit>(() => RemoteEventsCubit(locator()));
  locator.registerLazySingleton<LocalEventsCubit>(
      () => LocalEventsCubit(locator()));

  //usecase
  locator.registerLazySingleton<GetEvents>(() => GetEvents(locator()));
  locator.registerLazySingleton<Favorits>(() => Favorits(locator()));

  //repository
  locator.registerLazySingleton<OnlineEventRepository>(
      () => OnlineEventRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<OfflineEventRepository>(
      () => OfflineEventRepositoryImpl(offlineDataSource: locator()));

  //data source
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  locator
      .registerLazySingleton<OfflineDataSource>(() => OfflineDataSourceImpl());
}
