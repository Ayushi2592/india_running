import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:india_running/features/feature1/presentation/bloc/trending_event_event.dart';
import 'package:india_running/features/feature1/presentation/bloc/trending_event_state.dart';

import '../../domain/usecases/get_trending_events.dart';

class TrendingEventBloc extends Bloc<TrendingEventEvent, TrendingEventState> {
  final GetTrendingEvents getTrendingEvents;

  TrendingEventBloc({required this.getTrendingEvents}) : super(TrendingEventLoading()) {
    on<LoadTrendingEvents>(_onLoadTrendingEvents);
  }

  Future<void> _onLoadTrendingEvents(
      LoadTrendingEvents event, Emitter<TrendingEventState> emit) async {
    print('LoadTrendingEvents triggered'); // Debugging
    emit(TrendingEventLoading());

    final result = await getTrendingEvents();

    result.fold(
          (error) {
        print('BLoC Error State: $error'); // Debugging
        emit(TrendingEventError(error));
      },
          (events) {
        print('BLoC Loaded State: ${events.length} events'); // Debugging
        emit(TrendingEventLoaded(events));
      },
    );
  }
}
