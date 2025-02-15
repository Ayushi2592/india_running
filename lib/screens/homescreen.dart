import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../app_constants.dart';
import 'homescreenstatenotifier.dart';


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HomeScreenStateNotifier>(context, listen: false)
          .startSearchTextAnimation();
    });
  }

  @override
  Widget build(BuildContext context) {
    final stateNotifier = Provider.of<HomeScreenStateNotifier>(context);
    final animatedSearchText = stateNotifier.animatedSearchText;

    final List<Map<String, String>> eventData = [
      {'image': AppImages.poster1, 'cost': '₹525 onwards', 'distance': '2.5 km', 'location': 'New Delhi', 'race': 'Indian Navy Half Marathon'},
      {'image': AppImages.poster2, 'cost': '₹2500 onwards', 'distance': '1.8 km', 'location': 'Chandigarh', 'race': 'Chandigarh Fast Marathon'},
      {'image': AppImages.poster3, 'cost': '₹500 onwards', 'distance': '5 km', 'location': 'Amani Byrathikhane', 'race': 'Trail Adventure'},
      {'image': AppImages.poster4, 'cost': '₹30 onwards', 'distance': '3 km', 'location': 'Uptown', 'race': 'Night Run'},
      {'image': AppImages.poster5, 'cost': '₹10 onwards', 'distance': '0.8 km', 'location': 'Old Town', 'race': 'Fun Run'},
      {'image': AppImages.poster6, 'cost': '₹50 onwards', 'distance': '8 km', 'location': 'Outskirts', 'race': 'Ultra Marathon'},
    ];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: AppPaddings.horizontal.add(AppPaddings.vertical),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(AppImages.logo, height: 40),
                        const SizedBox(width: 10),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(AppText.appName, style: AppTextStyles.logoText),
                            Text(AppText.appSecondName, style: AppTextStyles.logoText),
                          ],
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () => context.push('/profile'),
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
                  onTap: () => context.push('/search'),
                  child: TextField(
                    enabled: false,
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
              GestureDetector(
                onTap: () => context.push('/carousel'),
                child: CarouselSlider(
                  items: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(AppImages.image1, fit: BoxFit.cover),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(AppImages.image2, fit: BoxFit.cover),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.asset(AppImages.image3, fit: BoxFit.cover),
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
              const Padding(
                padding: AppPaddings.horizontal,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(AppText.trendingEvents, style: AppTextStyles.heading),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => context.push('/trending'),
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
                                Row(
                                  children: [
                                    const Icon(Icons.location_on, size: 16, color: AppColors.textGrey),
                                    const SizedBox(width: 5),
                                    Text(event['location']!, style: AppTextStyles.subheading),
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