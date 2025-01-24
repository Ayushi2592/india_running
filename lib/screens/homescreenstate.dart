import 'package:equatable/equatable.dart';

abstract class HomeScreenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class HomeScreenInitial extends HomeScreenState {}

class SearchTextUpdated extends HomeScreenState {
  final String animatedSearchText;

  SearchTextUpdated(this.animatedSearchText);

  @override
  List<Object?> get props => [animatedSearchText];
}
