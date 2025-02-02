import 'package:equatable/equatable.dart';
import '../../domain/entities/trending_event.dart';

abstract class TrendingEventState extends Equatable {
  @override
  List<Object> get props => [];
}

class TrendingEventLoading extends TrendingEventState {}

class TrendingEventLoaded extends TrendingEventState {
  final List<TrendingEvent> events;

  TrendingEventLoaded(this.events);

  @override
  List<Object> get props => [events];
}

class TrendingEventError extends TrendingEventState {
  final String message;

  TrendingEventError(this.message);

  @override
  List<Object> get props => [message];
}
