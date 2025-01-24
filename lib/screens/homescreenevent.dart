import 'package:equatable/equatable.dart';

abstract class HomeScreenEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class StartSearchTextAnimation extends HomeScreenEvent {}
