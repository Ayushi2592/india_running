/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:india_running/features/event_details/presentation/screens/event_screen.dart';
import 'package:india_running/features/profile/presentation/screens/account_details.dart';
import 'package:india_running/features/profile/presentation/screens/account_settings.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screens/homescreen.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/bloc/profile_event.dart';
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/register/presentattion/pages/register_screen.dart';
import 'features/register/presentattion/pages/review_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (_) => HomeBloc()..add(StartSearchTextAnimation()),
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
          create: (_) => ProfileBloc()..add(LoadProfileEvent()),
          child: const ProfileScreen(),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: _router,
    );
  }
}

 */

/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:india_running/features/home/data/datasources/home_remote_data_sources.dart';

import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screens/homescreen.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/bloc/profile_event.dart';
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/register/presentattion/pages/register_screen.dart';
import 'features/register/presentattion/pages/review_screen.dart';
import 'features/profile/presentation/screens/account_details.dart';
import 'features/profile/presentation/screens/account_settings.dart';
import 'features/event_details/presentation/screens/event_screen.dart';
import 'features/home/data/repositories/event_repository_impl.dart';
import 'features/home/domain/usecases/fetch_events_usecase.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => BlocProvider(
          create: (_) => HomeBloc(FetchEventsUseCase(EventRepositoryImpl(EventRemoteDataSource)))
            ..add(FetchHomeEvents()),
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
          create: (_) => ProfileBloc()..add(LoadProfileEvent()),
          child: const ProfileScreen(),
        ),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: _router,
    );
  }
}

 */


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;
import 'package:india_running/features/event_details/domain/usecases/fetch_trending_events_usecase.dart';
import 'package:india_running/features/home/presentation/screens/search.dart';
import 'package:india_running/features/payment/payment_screen.dart';
import 'package:india_running/features/profile/presentation/screens/certificates.dart';
import 'package:india_running/features/profile/presentation/screens/emergency_details.dart';
import 'package:india_running/features/profile/presentation/screens/personal_info.dart';
import 'features/event_details/domain/repositories/event_repository.dart';
import 'features/event_details/presentation/bloc/event_bloc.dart';
import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screens/homescreen.dart';
import 'features/profile/presentation/bloc/profile_bloc.dart';
import 'features/profile/presentation/bloc/profile_event.dart';
import 'features/profile/presentation/screens/myraces.dart';
import 'features/profile/presentation/screens/profile_screen.dart';
import 'features/profile/presentation/screens/race_kit.dart';
import 'features/register/presentattion/pages/register_screen.dart';
import 'features/register/presentattion/pages/review_screen.dart';
import 'features/profile/presentation/screens/account_details.dart';
import 'features/profile/presentation/screens/account_settings.dart';
import 'features/event_details/presentation/screens/event_screen.dart';
import 'features/home/data/datasources/home_remote_data_sources.dart';
import 'features/home/data/repositories/event_repository_impl.dart';
import 'features/home/domain/usecases/fetch_events_usecase.dart';
import 'package:india_running/features/profile/presentation/screens/address.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  final homeRemoteDataSource = HomeRemoteDataSourceImpl(http.Client());
  final eventRepository = EventRepositoryImpl(homeRemoteDataSource);
  final fetchEventsUseCase = FetchEventsUseCase(eventRepository);

  runApp(MyApp(fetchEventsUseCase: fetchEventsUseCase));
}

class MyApp extends StatelessWidget {
  final FetchEventsUseCase fetchEventsUseCase;

  const MyApp({required this.fetchEventsUseCase, super.key});

  @override
  Widget build(BuildContext context) {
    final GoRouter _router = GoRouter(
      routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => BlocProvider(
            create: (_) => HomeBloc(fetchEventsUseCase)..add(FetchHomeEvents()),
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: '/trending',
          builder: (context, state) {
            final eventData = state.extra as Map<String, dynamic>?;
            return BlocProvider(
              create: (context) => EventBloc(
                fetchTrendingEventsUseCase: context.read<FetchTrendingEventsUseCase>(),
                eventRepository: context.read<EventRepository>(),
              )..add(FetchEventsEvent()),
              child: TrendingEventScreen(eventData: eventData),
            );
          },
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
          path: '/myraces',
          builder: (context, state) => const MyRace(),
        ),
        GoRoute(
          path: '/certificates',
          builder: (context, state) => const Certificates(),
        ),
        GoRoute(
          path: '/personalinfo',
          builder: (context, state) => const PersonalInfo(),
        ),
        GoRoute(
          path: '/search',
          builder: (context, state) => Search(),
        ),
        GoRoute(
          path: '/address',
          builder: (context, state) => const Address(),
        ),
        GoRoute(
          path: '/emergency_details',
          builder: (context, state) => const EmergencyDetails(),
        ),
        GoRoute(
          path: '/paymentscreen',
          builder: (context, state) => PaymentScreen(),
        ),
        GoRoute(
          path: '/race_kit',
          builder: (context, state) => RaceKit(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => BlocProvider(
            create: (_) => ProfileBloc()..add(LoadProfileEvent()),
            child: const ProfileScreen(),
          ),
        ),
      ],
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerConfig: _router,
    );
  }
}

