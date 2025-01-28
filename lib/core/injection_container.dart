import 'package:get_it/get_it.dart';
import 'package:india_running/features/home/domain/usecases/fetch_events_usecase.dart';
import 'package:india_running/features/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Register Use Cases
  sl.registerLazySingleton(() => FetchEventsUseCase);

  // Register Blocs
  sl.registerFactory(() => HomeBloc(sl<FetchEventsUseCase>()));
}
