import 'package:equatable/equatable.dart';

abstract class TrendingEventEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadTrendingEvents extends TrendingEventEvent {}
