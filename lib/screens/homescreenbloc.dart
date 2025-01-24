import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'homescreenevent.dart';
import 'homescreenstate.dart';

class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(HomeScreenInitial()) {
    on<StartSearchTextAnimation>(_onStartSearchTextAnimation);
  }

  final List<String> _searchAlternates = ['race', 'city', 'event venue'];
  Timer? _timer;

  void _onStartSearchTextAnimation(
      StartSearchTextAnimation event,
      Emitter<HomeScreenState> emit,
      ) {
    int index = 0;

    _timer?.cancel(); // Cancel any existing timer
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      emit(SearchTextUpdated(_searchAlternates[index]));
      index = (index + 1) % _searchAlternates.length;
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel(); // Dispose of the timer
    return super.close();
  }
}
