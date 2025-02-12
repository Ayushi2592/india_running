/*import 'package:flutter_bloc/flutter_bloc.dart';
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

 */

/////////////////////////////////////////////////////////////////////////////////////
/*import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/fetch_trending_events_usecase.dart';
import '../../data/models/event_model.dart';

abstract class EventEvent {}

class FetchEventsEvent extends EventEvent {}

abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<EventModel> events;
  EventLoaded({required this.events});
}

class EventError extends EventState {
  final String message;
  EventError({required this.message});
}

class EventBloc extends Bloc<EventEvent, EventState> {
  final FetchTrendingEventsUseCase fetchTrendingEventsUseCase;

  EventBloc({required this.fetchTrendingEventsUseCase})
      : super(EventInitial()) {
    on<FetchEventsEvent>((event, emit) async {
      emit(EventLoading());
      try {
        final List<EventModel> events = await fetchTrendingEventsUseCase();
        //emit(EventLoaded(events: events));
        emit(EventLoaded(events: events));
      } catch (e) {
        //emit(EventError(message: e.toString()));
        emit(EventError(message: 'Failed to fetch events.'));
      }
    });
  }
}

 */

///////////////////////////////////////////////////////////////////////////////////////////////

/*import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../event_details/domain/repositories/event_repository.dart';
import '../../domain/usecases/fetch_trending_events_usecase.dart';
import '../../data/models/event_model.dart';

abstract class EventEvent {}

class FetchEventsEvent extends EventEvent {}

abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  final List<EventModel> events;
  EventLoaded({required this.events});
}

class FetchEventDetailsEvent extends EventEvent {
  final String eventId;
  FetchEventDetailsEvent(this.eventId);
}
class EventDetailLoaded extends EventState {
  final Map<String, dynamic> eventDetails;
  EventDetailLoaded({required this.eventDetails});
}

class EventError extends EventState {
  final String message;
  EventError({required this.message});
}

class EventBloc extends Bloc<EventEvent, EventState> {
  final FetchTrendingEventsUseCase fetchTrendingEventsUseCase;
  final EventRepository eventRepository;
  EventBloc({required this.fetchTrendingEventsUseCase, required this.eventRepository,}) : super(EventInitial()) {
    on<FetchEventsEvent>((event, emit) async {
      emit(EventLoading());
      try {
        final events = await fetchTrendingEventsUseCase.call();
        emit(EventLoaded(events: events));
      } catch (e) {
        emit(EventError(message: 'Failed to fetch events.'));
      }
    });

    on<FetchEventDetailsEvent>((event, emit) async {
      emit(EventLoading());
      final result = await eventRepository.getEventDetails(event.eventId);
      result.fold(
            (failure) => emit(EventError(message: 'Failed to fetch event details.')),
            (eventDetails) => emit(EventDetailLoaded(eventDetails: eventDetails)),
      );
    });
  }
}

 */


import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/fetch_trending_events_usecase.dart';
import '../../domain/repositories/event_repository.dart';
import '../../data/models/event_model.dart';

abstract class EventEvent {}

class FetchEventsEvent extends EventEvent {}

class FetchEventDetailsEvent extends EventEvent {
  final String eventId;
  FetchEventDetailsEvent(this.eventId);
}

abstract class EventState {}

class EventInitial extends EventState {}

class EventLoading extends EventState {}

class EventLoaded extends EventState {
  //final Event event;

  //EventLoaded(this.event);
  final List<EventModel> event;
  EventLoaded({required this.event});

}



class EventDetailLoaded extends EventState {
  final Map<String, dynamic> eventDetails;
  EventDetailLoaded({required this.eventDetails});
}

class EventError extends EventState {
  final String message;
  EventError({required this.message});
}

/*class EventBloc extends Bloc<EventEvent, EventState> {
  final FetchTrendingEventsUseCase fetchTrendingEventsUseCase;
  final EventRepository eventRepository;

  EventBloc(FetchTrendingEventsUseCase, {
    required this.fetchTrendingEventsUseCase,
    required this.eventRepository,
  }) : super(EventInitial()) {
    on<FetchEventsEvent>((events, emit) async {
      emit(EventLoading());
      try {
        final events = await fetchTrendingEventsUseCase.call();
        if (events.isNotEmpty) {
          emit(EventLoaded(event: events));
        } else {
          emit(EventError(message: 'No events available.'));
        }
      } catch (e) {
        print('Error in FetchEventsEvent: $e');
        emit(EventError(message: 'Failed to fetch events.'));
      }
    });

    on<FetchEventDetailsEvent>((events, emit) async {
      emit(EventLoading());
      try {
        final result = await eventRepository.getEventDetails(events.eventId);
        result.fold(
              (failure) {
            print('Failed to fetch event details: $failure');
            emit(EventError(message: 'Failed to fetch event details.'));
          },
              (eventDetails) {
            print('Event details loaded successfully.');
            emit(EventDetailLoaded(eventDetails: eventDetails));
          },
        );
      } catch (e) {
        print('Exception in FetchEventDetailsEvent: $e');
        emit(EventError(message: 'Something went wrong.'));
      }
    });
  }
}

 */

class EventBloc extends Bloc<EventEvent, EventState> {
  final FetchTrendingEventsUseCase fetchTrendingEventsUseCase;
  final EventRepository eventRepository;

  EventBloc({
    required this.fetchTrendingEventsUseCase,
    required this.eventRepository,
  }) : super(EventInitial()) {
    on<FetchEventsEvent>((event, emit) async {
      emit(EventLoading());
      try {
        final events = await fetchTrendingEventsUseCase.call();
        if (events.isNotEmpty) {
          emit(EventLoaded(event: events));
        } else {
          emit(EventError(message: 'No events available.'));
        }
      } catch (e) {
        print('Error in FetchEventsEvent: $e');
        emit(EventError(message: 'Failed to fetch events.'));
      }
    });

    on<FetchEventDetailsEvent>((event, emit) async {
      emit(EventLoading());
      try {
        final result = await eventRepository.getEventDetails(event.eventId);
        result.fold(
              (failure) {
            print('Failed to fetch event details: $failure');
            emit(EventError(message: 'Failed to fetch event details.'));
          },
              (eventDetails) {
            print('Event details loaded successfully.');
            emit(EventDetailLoaded(eventDetails: eventDetails));
          },
        );
      } catch (e) {
        print('Exception in FetchEventDetailsEvent: $e');
        emit(EventError(message: 'Something went wrong.'));
      }
    });
  }
}






