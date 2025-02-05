//import 'dart:html';

//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:india_running/features/home/domain/usecases/fetch_events_usecase.dart';
//import 'package:india_running/features/home/domain/repositories/event_repository.dart';


//abstract class HomeEvent {}

//class FetchHomeEvents extends HomeEvent {}
//class StartSearchTextAnimation extends HomeEvent {}

//abstract class HomeState {}

//class HomeInitial extends HomeState {}

//class HomeLoading extends HomeState {}

//class HomeLoaded extends HomeState {
  //final List<String> events; // Example data
  //HomeLoaded(this.events);
//}

//class HomeError extends HomeState {
 // final String message;
  //HomeError(this.message);
//}
//Constructor accepts fetchEventsUseCase and eventRepository

//class HomeBloc extends Bloc<HomeEvent, HomeState> {
  //final FetchEventsUseCase fetchEventsUseCase;
  //final EventRepository eventRepository;

  //HomeBloc({
    //required this.fetchEventsUseCase,
    //required this.eventRepository, required EventRepository,
  //}) : super(HomeInitial()) {
    //on<FetchHomeEvents>((event, emit) async {
      //emit(HomeLoading());
      //try {
        //final events = await fetchEventsUseCase.call();
        //emit(HomeLoaded(events.cast<String>()));
     //} catch (e) {
        //emit(HomeError('Failed to fetch events.'));
      //}
    //});

    //on<StartSearchTextAnimation>((event, emit) {
    //});
  //}
//}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_running/features/home/domain/usecases/fetch_events_usecase.dart';
import 'package:india_running/features/home/domain/repositories/event_repository.dart';
import 'package:india_running/features/home/domain/entities/event_entities.dart';

abstract class HomeEvent {}

class FetchHomeEvents extends HomeEvent {}

class StartSearchTextAnimation extends HomeEvent {}

abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final List<Event> events;
  HomeLoaded(this.events);
}

class HomeError extends HomeState {
  final String message;
  HomeError(this.message);
}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FetchEventsUseCase fetchEventsUseCase;
  final EventRepository eventRepository;

  HomeBloc({
    required this.fetchEventsUseCase,
    required this.eventRepository,
  }) : super(HomeInitial()) {
    on<FetchHomeEvents>((event, emit) async {
      emit(HomeLoading());
      try {
        final events = await fetchEventsUseCase.call();
        emit(HomeLoaded(events));
      } catch (e) {
        emit(HomeError('Failed to fetch events.'));
      }
    });

    on<StartSearchTextAnimation>((event, emit) {});
  }
}



