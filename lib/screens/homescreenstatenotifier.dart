import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreenStateNotifier extends ChangeNotifier {
  List<String> searchAlternates = ['race', 'city', 'event venue'];
  String _animatedSearchText = 'race';
  Timer? _timer;

  String get animatedSearchText => _animatedSearchText;

  void startSearchTextAnimation() {
    int index = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      _animatedSearchText = searchAlternates[index];
      index = (index + 1) % searchAlternates.length;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
