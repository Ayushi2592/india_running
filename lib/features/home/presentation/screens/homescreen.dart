//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';

//import '../../data/repositories/event_repository_impl.dart';
//import '../../domain/usecases/fetch_events_usecase.dart';
//import '../bloc/home_bloc.dart';
//import '../widgets/event_card.dart';

//class HomeScreen extends StatelessWidget {
 // @override
  //Widget build(BuildContext context) {
    //return BlocProvider(
      //create: (context) => HomeBloc(FetchEventsUseCase(EventRepositoryImpl()))..add(FetchHomeEvents()),
      //child: Scaffold(
        //body: SafeArea(
          //child: BlocBuilder<HomeBloc, HomeState>(
            //builder: (context, state) {
              //if (state is HomeLoading) {
                //return const Center(child: CircularProgressIndicator());
              //} else if (state is HomeLoaded) {
                //return SingleChildScrollView(
                  //child: Column(
                    //children: state.events.map((event) => EventCard(event: event)).toList(),
                 // ),
                //);
              //} else if (state is HomeError) {
                //return Center(child: Text(state.message));
              //}
              //return const SizedBox();
            //},
          //),
        //),
      //),
    //);
 // }
//}
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../widgets/event_card.dart';
import '../widgets/search_bar.dart';  // Make sure the import is correct

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
                child: CustomSearchBar(searchText: animatedSearchText),  // Pass animatedSearchText here
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
                  child: Text('Trending Events', style: AppTextStyles.heading),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => context.push('/trending'),
                child: Column(
                  children: eventData.map((event) {
                    return Padding(
                      padding: AppPaddings.all,
                      child: EventCard(
                        eventName: event['race']!,
                        eventLocation: event['location']!,
                        eventPrice: event['cost']!,
                        eventImage: event['image']!,
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
