import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../event_details/data/models/event_model.dart';
import '../../domain/usecases/fetch_trending_events_usecase.dart';

abstract class EventDetailsEvent {}

class FetchEventsEvent extends EventDetailsEvent {}

abstract class EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<EventModel> events;

  EventLoaded({required this.events});
}

class EventError extends EventState {
  final String message;

  EventError({required this.message});
}

class EventBloc extends Bloc<EventDetailsEvent, EventState> {
  final FetchTrendingEventsUseCase fetchTrendingEventsUseCase;

  EventBloc({required this.fetchTrendingEventsUseCase}) : super(EventLoading()) {
    on<FetchEventsEvent>(_onFetchEventsEvent);
  }

  Future<void> _onFetchEventsEvent(
      FetchEventsEvent event, Emitter<EventState> emit) async {
    emit(EventLoading());
    try {
      final events = await fetchTrendingEventsUseCase.call();
      emit(EventLoaded(events: events));
    } catch (e) {
      emit(EventError(message: e.toString()));
    }
  }
}
