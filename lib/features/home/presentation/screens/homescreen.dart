/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/home_bloc.dart';
import '../widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
 @override
 _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 @override
 void initState() {
  super.initState();
  context.read<HomeBloc>().add(FetchHomeEvents());
 }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   body: SafeArea(
    child: SingleChildScrollView(
     child: Column(
      children: [
       BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
         if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
         } else if (state is HomeLoaded) {
          return Column(
           children: state.events.map((event) {
            return Padding(
             padding: EdgeInsets.all(8.0),
             child: GestureDetector(
              onTap: () => context.push('/trending', extra: event),
              child: EventCard(event: event, eventName: '', eventLocation: '', eventPrice: '', eventImage: '',),
             ),
            );
           }).toList(),
          );
         } else if (state is HomeError) {
          return Center(child: Text(state.message));
         }
         return const SizedBox();
        },
       ),
      ],
     ),
    ),
   ),
  );
 }
}*/

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../bloc/home_bloc.dart';
import '../widgets/event_card.dart';


class HomeScreen extends StatefulWidget {
 @override
 _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
 @override
 void initState() {
  super.initState();
  context.read<HomeBloc>().add(FetchHomeEvents());
 }

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   body: SafeArea(
    child: SingleChildScrollView(
     child: Column(
      children: [
       _buildAppHeader(context),

       const SizedBox(height: 10),

       _buildSearchBar(context),

       const SizedBox(height: 20),

       _buildEventCarousel(),

       const SizedBox(height: 20),

       const Padding(
        padding: AppPaddings.horizontal,
        child: Align(
         alignment: Alignment.centerLeft,
         child: Text(AppText.trendingEvents, style: AppTextStyles.heading),
        ),
       ),

       const SizedBox(height: 10),

       BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
         if (state is HomeLoading) {
          return const Center(child: CircularProgressIndicator());
         } else if (state is HomeLoaded) {
          return Column(
           children: state.events.map((event) {
            return GestureDetector(
             onTap: () => context.push('/trending', extra: event),
             child: EventCard(
              event: event,
              eventName: event.race,
              eventLocation: event.location,
              eventPrice: event.race,
              eventImage: event.image,
             ),
            );
           }).toList(),
          );
         } else if (state is HomeError) {
          return Center(child: Text(state.message));
         }
         return const SizedBox();
        },
       ),
      ],
     ),
    ),
   ),
  );
 }
 Widget _buildAppHeader(BuildContext context) {
  return Padding(
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
  );
 }

 // Search Bar
 Widget _buildSearchBar(BuildContext context) {
  return Padding(
   padding: AppPaddings.horizontal,
   child: GestureDetector(
    onTap: () => context.push('/search'),
    child: TextField(
     enabled: false,
     decoration: InputDecoration(
      hintText: 'Search for events...',
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
  );
 }

 // Event Carousel
 Widget _buildEventCarousel() {
  return GestureDetector(
   onTap: () => context.push('/carousel'),
   child: CarouselSlider(
    items: [
     _buildCarouselItem(AppImages.image1),
     _buildCarouselItem(AppImages.image2),
     _buildCarouselItem(AppImages.image3),
    ],
    options: CarouselOptions(
     height: 200.0,
     autoPlay: true,
     enlargeCenterPage: true,
     aspectRatio: 16 / 9,
     enableInfiniteScroll: true,
    ),
   ),
  );
 }

 Widget _buildCarouselItem(String imagePath) {
  return ClipRRect(
   borderRadius: BorderRadius.circular(16.0),
   child: Image.asset(imagePath, fit: BoxFit.cover),
  );
 }
}
