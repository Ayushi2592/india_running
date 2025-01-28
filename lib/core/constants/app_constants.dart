import 'package:flutter/material.dart';


class AppColors {
  static const Color primary = Color(0xFF15B8A6);
  static const Color primaryLight = Color(0x3315B8A6);
  static const Color searchBarFill = Color(0xff1a1a1a0a);
  static const Color textDark = Color(0xFF1A1A1A);
  static const Color textGrey = Colors.grey;
}

class AppText {
  static const String appName = 'INDIA';
  static const String appSecondName = 'RUNNING';
  static const String searchPlaceholder = 'Search for';
  static const String trendingEvents = 'Trending Events';
  static const String onwards = ' onwards';
}


class AppTextStyles {
  static const TextStyle logoText = TextStyle(
    fontFamily: 'Man rope',
    fontSize: 16.0,
    fontStyle: FontStyle.italic,
    fontWeight: FontWeight.bold,
    color: Colors.black,
  );

  static const TextStyle hintText = TextStyle(
    fontFamily: 'Man rope',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
  );

  static const TextStyle heading = TextStyle(
    fontFamily: 'Man rope',
    fontSize: 16.0,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const TextStyle subheading = TextStyle(
    fontFamily: 'Man rope',
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.textGrey,
  );

  static const TextStyle price = TextStyle(
    fontFamily: 'Man rope',
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.primary,
  );
}


class AppPaddings {
  static const EdgeInsets horizontal = EdgeInsets.symmetric(horizontal: 16.0);
  static const EdgeInsets vertical = EdgeInsets.symmetric(vertical: 16.0);
  static const EdgeInsets all = EdgeInsets.all(16.0);
}

class AppImages {
  static const String logo = 'images/logo.png';
  static const String image1 = 'images/image1.png';
  static const String image2 = 'images/image2.png';
  static const String image3 = 'images/image3.png';
  static const String poster1 = 'images/poster1.png';
  static const String poster2 = 'images/poster2.png';
  static const String poster3 = 'images/poster3.png';
  static const String poster4 = 'images/poster4.png';
  static const String poster5 = 'images/poster5.png';
  static const String poster6 = 'images/poster6.png';
}