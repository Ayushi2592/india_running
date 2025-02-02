import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_trending_events.dart';
import 'event_event.dart';
import 'event_state.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  final GetTrendingEvents getTrendingEvents;

  EventBloc(this.getTrendingEvents) : super(EventInitial()) {
    on<LoadTrendingEvents>((event, emit) async {
      emit(EventLoading());
      try {
        print('Fetching trending events...');
        final events = await getTrendingEvents();
        print('Fetched events: $events');
        emit(EventLoaded(events));
      } catch (e) {
        print('Error fetching events: $e');
        emit(EventError('Failed to load events'));
      }
    });
  }
}
