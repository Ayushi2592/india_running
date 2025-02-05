//import 'package:get_it/get_it.dart';
//import '../features/home/data/repositories/event_repository_impl.dart';
//import '../features/home/domain/repositories/event_repository.dart';
//import '../features/home/domain/usecases/fetch_events_usecase.dart';
//import '../features/home/presentation/bloc/home_bloc.dart';

//final GetIt sl = GetIt.instance;

//void setupLocator() {
  // Register the repository first
  //sl.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());

  // Register the use case and inject the repository
  //sl.registerLazySingleton<FetchEventsUseCase>(() => FetchEventsUseCase(eventRepository: sl<EventRepository>()));

  // Register HomeBloc and inject required dependencies correctly
  //sl.registerLazySingleton<HomeBloc>(() => HomeBloc(
    //fetchEventsUseCase: sl<FetchEventsUseCase>(),
    //eventRepository: sl<EventRepository>(),
  //));
//}

import 'package:get_it/get_it.dart';
import '../features/home/data/repositories/event_repository_impl.dart';
import '../features/home/domain/repositories/event_repository.dart';
import '../features/home/domain/usecases/fetch_events_usecase.dart';
import '../features/home/presentation/bloc/home_bloc.dart';
import '../features/profile/data/datasources/profile_remote_data_source.dart';
import '../features/profile/data/repositories/profile_repository_impl.dart';
import '../features/profile/domain/repositories/profile_repository.dart';
import '../features/profile/domain/usecaese/get_profile_usecases.dart';
import '../features/profile/presentation/bloc/profile_bloc.dart';

final GetIt sl = GetIt.instance;

void setupLocator() {
  // Register HomeBloc with its dependencies
  sl.registerLazySingleton<HomeBloc>(() => HomeBloc(
    fetchEventsUseCase: sl<FetchEventsUseCase>(),
    eventRepository: sl<EventRepository>(),
  ));

  sl.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());
  sl.registerLazySingleton<FetchEventsUseCase>(() => FetchEventsUseCase(eventRepository: sl<EventRepository>()));
  //sl.registerLazySingleton<ProfileBloc>(() => ProfileBloc(getProfileUseCase: sl<GetProfileUseCase>()));
  sl.registerLazySingleton<ProfileRemoteDataSource>(
        () => ProfileRemoteDataSourceImpl(),
  );
  sl.registerLazySingleton<ProfileRepository>(
        () => ProfileRepositoryImpl(remoteDataSource: sl<ProfileRemoteDataSource>()),
  );
  sl.registerLazySingleton<GetProfileUseCase>(
        () => GetProfileUseCase(repository: sl<ProfileRepository>()),
  );
  sl.registerLazySingleton<ProfileBloc>(
        () => ProfileBloc(getProfileUseCase: sl<GetProfileUseCase>()),
  );

}



//final sl = GetIt.instance;
//void init() {
  //sl.registerLazySingleton<EventRepository>(() => EventRepositoryImpl());
  //sl.registerLazySingleton<FetchEventsUseCase>(() => FetchEventsUseCase(eventRepository: sl<EventRepository>()));

  //sl.registerFactory<HomeBloc>(() => HomeBloc(
    //fetchEventsUseCase: sl<FetchEventsUseCase>(),
    //eventRepository: sl<EventRepository>(),
  //));
//}
