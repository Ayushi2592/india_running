import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:india_running/screens/CarouselScreen.dart';
import 'package:india_running/screens/ProfileScreen.dart';
import 'package:india_running/screens/homescreen.dart';
import 'package:india_running/screens/homescreenbloc.dart';
import 'package:india_running/screens/homescreenevent.dart';
import 'package:india_running/screens/searchscreen.dart';
import 'package:india_running/screens/trendingeventscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (context) => HomeScreenBloc()..add(StartSearchTextAnimation()),
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileScreen(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => const SearchScreen(),
        ),
        GoRoute(
          path: '/carousel',
          builder: (context, state) => const CarouselScreen(),
        ),
        GoRoute(
          path: '/trending',
          builder: (context, state) => const TrendingEventsScreen(),
        ),
      ],
    );

    return MaterialApp.router(
      routerConfig: _router,
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
