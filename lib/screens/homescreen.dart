import 'dart:async';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
      {'image': 'images/poster3.png', 'cost': '₹500 onwards', 'distance': '5 km', 'location': 'Amani Byrathikhane ', 'race': 'Trail Adventure'},
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
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('images/logo.png', height: 40),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: const Text(
                                'INDIA',
                                style: const TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 1.0),
                              child: const Text(
                                'RUNNING',
                                style: const TextStyle(
                                  fontFamily: 'Manrope',
                                  fontSize: 16.0,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),

                      ],
                    ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color(0x3315B8A6),
                      child: Icon(
                        Icons.person,
                        size: 20,
                        color: const Color(0xFF15B8A6),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              // Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for $animatedSearchText...',
                    hintStyle: const TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 14.0,
                      fontWeight: FontWeight.w400,
                    ),
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor:const  Color(0xFF1A1A1A0A),
                    ),
                  ),
                ),
              SizedBox(height: 20),
              // Carousel Slider
              CarouselSlider(
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
              SizedBox(height: 20),
              // Trending Events Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Trending Events',
                    style: const TextStyle(
                      fontFamily: 'Manrope',
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: const Color(0xFF1A1A1A),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Event Cards
              Column(
                children: eventData.map((event) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                    child: Container(
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
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
                          Text(
                            event['race']!,
                            style: const TextStyle(
                              fontFamily: 'Manrope',
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.location_on, size: 16, color: Colors.grey),
                                      const SizedBox(width: 5),
                                      Text(
                                        event['location']!,
                                        style: const TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                                      const SizedBox(width: 5),
                                      Text(
                                        '12 Jan 2025',
                                        style: const TextStyle(
                                          fontFamily: 'Manrope',
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              RichText(
                                text: TextSpan(
                                  text: event['cost']!.split(' ')[0],
                                  style: const TextStyle(
                                    fontFamily: 'Manrope',
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF15B8A6),
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' onwards',
                                      style:const TextStyle(
                                        fontFamily: 'Manrope',
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
        ]
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
}