import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:india_running/features/event_details/presentation/screens/event_screen.dart';
import 'package:india_running/features/profile/presentation/screens/account_details.dart';
import 'package:india_running/features/profile/presentation/screens/account_settings.dart';
import 'core/injection_container.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screens/homescreen.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/bloc/profile_event.dart';
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/register/presentattion/pages/register_screen.dart';
import 'features/register/presentattion/pages/review_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setupLocator(); // Initialize dependencies
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

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
        path: '/trending',
        builder: (context, state) => const TrendingEventScreen(),
      ),
      GoRoute(
        path: '/review',
        builder: (context, state) => const ReviewDetailsScreen(),
      ),

      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => const AccountDetailsScreen(),
      ),
      GoRoute(
        path: '/accountsettings',
        builder: (context, state) => const AccountSettingsScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => BlocProvider(
          create: (context) => sl<ProfileBloc>()..add(LoadProfileEvent()),
          child: const ProfileScreen(),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => sl<HomeBloc>()..add(StartSearchTextAnimation()),
        ),
        BlocProvider<ProfileBloc>(
          create: (context) => sl<ProfileBloc>()..add(LoadProfileEvent()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Colors.white,
        ),
        routerConfig: _router,
      ),
    );
  }
}
