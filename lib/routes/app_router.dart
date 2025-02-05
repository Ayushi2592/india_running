import 'package:flutter/material.dart';
import 'package:india_running/features/profile/presentation/screens/account_settings.dart';
import '../features/home/presentation/screens/homescreen.dart';
import '../features/event_details/presentation/screens/event_screen.dart';
import '../features/profile/presentation/screens/account_details.dart';
import '../features/register/presentattion/pages/register_screen.dart';
import '../features/register/presentattion/pages/review_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/trending':
        return MaterialPageRoute(builder: (_) => const TrendingEventScreen());
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/review':
        return MaterialPageRoute(builder: (_) => const ReviewDetailsScreen());
      case '/account':
        return MaterialPageRoute(builder: (_) => const AccountDetailsScreen());
      case '/accountsettings':
        return MaterialPageRoute(builder: (_) => const AccountSettingsScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
