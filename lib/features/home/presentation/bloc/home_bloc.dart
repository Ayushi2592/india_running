import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_running/features/home/domain/usecases/fetch_events_usecase.dart';

// Events
abstract class HomeEvent {}

class FetchHomeEvents extends HomeEvent {}
class StartSearchTextAnimation extends HomeEvent {}

// States
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<String> events; // Example data
  HomeLoaded(this.events);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

// Bloc
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(FetchEventsUseCase fetchEventsUseCase) : super(HomeInitial()) {
    on<FetchHomeEvents>((event, emit) async {
      emit(HomeLoading());
      try {
        // Fetch events (dummy data for now)
        await Future.delayed(Duration(seconds: 2));
        emit(HomeLoaded(['Event 1', 'Event 2', 'Event 3']));
      } catch (e) {
        emit(HomeError('Failed to fetch events.'));
      }
    });
    on<StartSearchTextAnimation>((event, emit) {
      // Any animation logic here
    });
  }
}
