import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:india_running/screens/ProfileScreen.dart';
import 'package:india_running/screens/homescreen.dart';
import 'package:india_running/screens/homescreencubit.dart';
import 'package:india_running/screens/searchscreen.dart';
import 'package:india_running/screens/trendingeventscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Provide the Cubit for HomeScreen
        BlocProvider(
          create: (_) => HomeScreenCubit()..startSearchTextAnimation(),
        ),
        // Add other Cubits here if needed for other screens.
      ],
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}

// Define your routes using GoRouter
final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) => HomeScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => ProfileScreen(),
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => SearchScreen(),
    ),
    GoRoute(
      path: '/trending',
      builder: (context, state) => TrendingEventsScreen(),
    ),
  ],
);
