import 'package:get_it/get_it.dart';
import 'package:katim_task/data/datasource/online/event_remote_datasource.dart';
import 'package:katim_task/data/repositories/api_repository_impl.dart';
import 'package:katim_task/domain/usecases/get_events.dart';
import 'package:http/http.dart' as http;

import 'data/datasource/offline/event_offline_datasource.dart';
import 'data/repositories/offline_repository_impl.dart';
import 'domain/repositories/api_repository.dart';
import 'domain/repositories/offline_repository.dart';
import 'presentation/cubits/local_events/local_events_cubit.dart';
import 'presentation/cubits/remote_events/remote_events_cubit.dart';

final locator = GetIt.instance;

void init() {
  // bloc
  locator
      .registerFactory<RemoteEventsCubit>(() => RemoteEventsCubit(locator()));
  locator.registerFactory<LocalEventsCubit>(() => LocalEventsCubit(locator()));

  //usecase
  locator.registerLazySingleton<GetEvents>(() => GetEvents(locator()));

  //repository
  locator.registerLazySingleton<EventRepository>(
      () => EventRepositoryImpl(remoteDataSource: locator()));

  locator.registerLazySingleton<DatabaseRepository>(
      () => DatabaseRepositoryImpl(offlineDataSource: locator()));

  //data source
  locator.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());
  locator
      .registerLazySingleton<OfflineDataSource>(() => OfflineDataSourceImpl());

  locator.registerLazySingleton(() => http.Client);
}
