import 'package:flutter/material.dart';
import 'package:india_running/features/payment/payment_screen.dart';
import 'package:india_running/features/profile/presentation/screens/account_settings.dart';
import 'package:india_running/features/profile/presentation/screens/address.dart';
import 'package:india_running/features/profile/presentation/screens/certificates.dart';
import 'package:india_running/features/profile/presentation/screens/emergency_details.dart';
import 'package:india_running/features/profile/presentation/screens/personal_info.dart';
import '../features/home/presentation/screens/homescreen.dart';
import '../features/event_details/presentation/screens/event_screen.dart';
import '../features/home/presentation/screens/search.dart';
import '../features/profile/presentation/screens/account_details.dart';
import '../features/profile/presentation/screens/myraces.dart';
import '../features/register/presentattion/pages/register_screen.dart';
import '../features/register/presentattion/pages/review_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/trending':
        final eventData = settings.arguments as Map<String, dynamic>?;
        return MaterialPageRoute(
          builder: (_) =>  TrendingEventScreen(eventData: eventData ),
        );
      case '/register':
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case '/review':
        return MaterialPageRoute(builder: (_) => const ReviewDetailsScreen());
      case '/account':
        return MaterialPageRoute(builder: (_) => const AccountDetailsScreen());
      case '/accountsettings':
        return MaterialPageRoute(builder: (_) => const AccountSettingsScreen());
      case '/myraces':
        return MaterialPageRoute(builder: (_) =>  const MyRace());
      case '/certificates':
        return MaterialPageRoute(builder: (_) => const Certificates());
      case '/personalinfo':
        return MaterialPageRoute(builder: (_) => const PersonalInfo());
      case '/search':
        return MaterialPageRoute(builder: (_) => Search());
      case '/address':
        return MaterialPageRoute(builder: (_) => const Address()); 
      case '/emergency_details':
        return MaterialPageRoute(builder: (_) => const EmergencyDetails()); 
      case '/paymentscreen':
        return MaterialPageRoute(builder: (_) =>  PaymentScreen());      
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
