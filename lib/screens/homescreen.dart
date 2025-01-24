import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:india_running/screens/CarouselScreen.dart';
import 'package:india_running/screens/ProfileScreen.dart';
import 'package:india_running/screens/searchscreen.dart';
import 'package:india_running/screens/trendingeventscreen.dart';
import '../app_constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> searchAlternates = ['race', 'city', 'event venue'];
  String animatedSearchText = 'race';
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startSearchTextAnimation();
  }

  void _startSearchTextAnimation() {
    int index = 0;
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        animatedSearchText = searchAlternates[index];
        index = (index + 1) % searchAlternates.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> eventData = [
      {'image': 'images/poster1.png', 'cost': '₹525 onwards', 'distance': '2.5 km', 'location': 'New Delhi', 'race': 'Indian Navy Half Marathon'},
      {'image': 'images/poster2.png', 'cost': '₹2500 onwards', 'distance': '1.8 km', 'location': 'Chandigarh', 'race': 'Chandigarh Fast Marathon'},
      {'image': 'images/poster3.png', 'cost': '₹500 onwards', 'distance': '5 km', 'location': 'Amani Byrathikhane', 'race': 'Trail Adventure'},
      {'image': 'images/poster4.png', 'cost': '₹30 onwards', 'distance': '3 km', 'location': 'Uptown', 'race': 'Night Run'},
      {'image': 'images/poster5.png', 'cost': '₹10 onwards', 'distance': '0.8 km', 'location': 'Old Town', 'race': 'Fun Run'},
      {'image': 'images/poster6.png', 'cost': '₹50 onwards', 'distance': '8 km', 'location': 'Outskirts', 'race': 'Ultra Marathon'},
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Section
              Padding(
                padding: AppPaddings.horizontal.add(AppPaddings.vertical),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('images/logo.png', height: 40),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('INDIA', style: AppTextStyles.logoText),
                            Text('RUNNING', style: AppTextStyles.logoText),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ProfileScreen()));
                      },
                      child: const CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primaryLight,
                        child: Icon(Icons.person, size: 20, color: AppColors.primary),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: AppPaddings.horizontal,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SearchScreen()),
                    );
                  },
                  child: TextField(
                    enabled: false, // Disable direct interaction with the TextField
                    decoration: InputDecoration(
                      hintText: 'Search for $animatedSearchText...',
                      hintStyle: AppTextStyles.hintText,
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: AppColors.searchBarFill,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              // Carousel Slider
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CarouselScreen()));
                },
                child: CarouselSlider(
                  items: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset('images/image1.png', fit: BoxFit.cover),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset('images/image2.png', fit: BoxFit.cover),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset('images/image3.png', fit: BoxFit.cover),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    aspectRatio: 16 / 9,
                    enableInfiniteScroll: true,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Trending Events Section
              const Padding(
                padding: AppPaddings.horizontal,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Trending Events', style: AppTextStyles.heading),
                ),
              ),
              const SizedBox(height: 10),
              // Event Cards
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => TrendingEventsScreen()));
                },
                child: Column(
                  children: eventData.map((event) {
                    return Padding(
                      padding: AppPaddings.all,
                      child: Container(
                        padding: AppPaddings.all,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                event['image']!,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(event['race']!, style: AppTextStyles.heading),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        const Icon(Icons.location_on, size: 16, color: AppColors.textGrey),
                                        const SizedBox(width: 5),
                                        Text(event['location']!, style: AppTextStyles.subheading),
                                      ],
                                    ),
                                  ],
                                ),
                                Text(event['cost']!, style: AppTextStyles.price),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
