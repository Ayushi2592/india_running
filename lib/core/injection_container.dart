import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:india_running/features/home/domain/usecases/fetch_events_usecase.dart';
import 'package:india_running/features/home/presentation/bloc/home_bloc.dart';
import '../features/feature1/data/repositories/trending_event_repository_impl.dart';
import '../features/feature1/domain/repositories/trending_event_repository.dart';
import '../features/feature1/domain/usecases/get_trending_events.dart';
import '../features/feature1/presentation/bloc/trending_event_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<http.Client>(() => http.Client());

  sl.registerLazySingleton(() => FetchEventsUseCase());
  sl.registerLazySingleton<TrendingEventRepository>(
        () => TrendingEventRepositoryImpl(client: sl<http.Client>()),
  );
  sl.registerLazySingleton<GetTrendingEvents>(
        () => GetTrendingEvents(sl<TrendingEventRepository>()),
  );
  sl.registerFactory(() => HomeBloc(sl<FetchEventsUseCase>()));
  sl.registerFactory(() => TrendingEventBloc(getTrendingEvents: sl<GetTrendingEvents>()));
}
