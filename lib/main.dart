import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'core/injection_container.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screens/carosuelscreen.dart';
import 'features/home/presentation/screens/homescreen.dart';
import 'features/home/presentation/screens/profilescreen.dart';
import 'features/home/presentation/screens/searchscreen.dart';
import 'features/home/presentation/screens/trendingeventscreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize dependency injection
  await initDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Define routes using `GoRouter`
  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (context) => sl<HomeBloc>()..add(StartSearchTextAnimation()),
          child: HomeScreen(),
        ),
      ),
      GoRoute(
        path: '/carousel',
        builder: (context, state) => const CarouselScreen(),
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
        path: '/trending',
        builder: (context, state) => const TrendingEventsScreen(),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Clean Architecture App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: _router,
    );
  }
}
