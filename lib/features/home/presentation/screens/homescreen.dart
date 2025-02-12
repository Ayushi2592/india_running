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
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../bloc/home_bloc.dart';
import '../widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

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
            crossAxisAlignment: CrossAxisAlignment.start,
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
                  child: Text(
                    AppText.trendingEvents,
                    style: AppTextStyles.heading,
                  ),
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
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            padding: AppPaddings.horizontal,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () =>
                                      context.push('/trending', extra: event),
                                  child: EventCard(
                                    event: event,
                                    eventName: event.name,
                                    eventVenue: event.name,
                                    eventbannerImage: event.bannerImage ?? '',
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _buildRoundLabel('5K'),
                                    const SizedBox(width: 8),
                                    _buildRoundLabel('10K'),
                                    const SizedBox(width: 8),
                                    _buildRoundLabel('21.1K'),
                                  ],
                                ),
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox(height: 10);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue.shade50,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.blue.shade900,
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

 */

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../bloc/home_bloc.dart';
import '../widgets/event_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildAppHeader(context),
              const SizedBox(height: 10),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildEventCarousel(),
              const SizedBox(height: 20),
              const Padding(
                padding: AppPaddings.horizontal,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    AppText.trendingEvents,
                    style: AppTextStyles.heading,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  if (state is HomeLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is HomeLoaded) {
                    final filteredEvents = state.events
                        .where((event) =>
                        event.name.toLowerCase().contains(_searchQuery.toLowerCase()))
                        .toList();

                    if (filteredEvents.isEmpty) {
                      return const Center(child: Text('No events found.'));
                    }

                    return Column(
                      children: filteredEvents.map((event) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Container(
                            padding: AppPaddings.horizontal,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                /*GestureDetector(
                                  onTap: () =>
                                      context.push('/trending', extra: event),
                                  child: EventCard(
                                    event: event,
                                    eventName: event.name,
                                    eventVenue: event.name,
                                    eventbannerImage: event.bannerImage ?? '',
                                  ),
                                ),*/
                                GestureDetector(
                                        onTap: () {
                                        final extraData = {
                                        'eventId': event.id,          
                                        'eventName': event.name,
                                        'eventVenue': event.venue,
                                        'eventBanner': event.bannerImage,
                                     };
                                      context.push('/trending', extra: extraData);
                                    },
                                    child: EventCard(
                                       eventId: event.id,
                                       event: event,
                                       eventName: event.name,
                                       eventVenue: event.venue,
                                       eventbannerImage: event.bannerImage ,


                                      ),
                                ),


                                const SizedBox(height: 8),
                                /*Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    _buildRoundLabel('5K'),
                                    const SizedBox(width: 8),
                                    _buildRoundLabel('10K'),
                                    const SizedBox(width: 8),
                                    _buildRoundLabel('21.1K'),
                                  ],
                                ),*/
                                const SizedBox(height: 10),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    );
                  } else if (state is HomeError) {
                    return Center(child: Text(state.message));
                  }
                  return const SizedBox(height: 10);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRoundLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue.shade50,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.blue.shade900,
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

  Widget _buildSearchBar() {
    return Padding(
      padding: AppPaddings.horizontal,
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          setState(() {
            _searchQuery = value;
          });
        },
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
    );
  }

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




///////////////////////////////////////////////////////////////////////////////////////////////////

/*import 'package:carousel_slider/carousel_slider.dart';
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
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  blurRadius: 8,
                                  spreadRadius: 2,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Event Image
                                ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                  child: Image.network(
                                    event.bannerImage ?? '',
                                    height: 150,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(height: 10),

                                // Event Details (Name, Location, Labels)
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        event.name,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Text(
                                        event.venue ?? 'Unknown Venue',
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      const SizedBox(height: 10),

                                      // Round Labels (5K, 10K, 21.1K)
                                      Row(
                                        children: [
                                          _buildRoundLabel('5K'),
                                          const SizedBox(width: 8),
                                          _buildRoundLabel('10K'),
                                          const SizedBox(width: 8),
                                          _buildRoundLabel('21.1K'),
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                    ],
                                  ),
                                ),
                              ],
                            ),
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

  Widget _buildRoundLabel(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 2),
        borderRadius: BorderRadius.circular(20.0),
        color: Colors.blue.shade50,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Manrope',
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          color: Colors.blue.shade900,
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
*/

