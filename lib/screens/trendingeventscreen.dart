import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:india_running/app_constants.dart';

class TrendingEventScreen extends StatelessWidget {
  const TrendingEventScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Header Section
                    Padding(
                      padding: AppPaddings.horizontal.add(AppPaddings.vertical),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => context.pop(),
                            child: const CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.primaryLight,
                              child: Icon(Icons.arrow_back, size: 20, color: AppColors.primary),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: const Padding(
                              padding: EdgeInsets.only(right: 16.0),
                              child: Icon(Icons.upload, size: 24, color: AppColors.primary),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Event Details Section
                    Padding(
                      padding: const EdgeInsets.all(16.0),
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
                            // Event Image
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8.0),
                              child: Image.asset(
                                AppImages.image3,
                                height: 150,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Event Title
                            const Text('India Navy', style: AppTextStyles.heading),
                            const SizedBox(height: 5),

                            // Event Location and Rating
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.location_on, size: 16, color: Colors.blue),
                                    SizedBox(width: 5),
                                    Text('Location', style: AppTextStyles.subheading),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.yellow),
                                    SizedBox(width: 4),
                                    Text('4.5', style: TextStyle(fontSize: 16)),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),

                            // Event Date
                            const Row(
                              children: [
                                Icon(Icons.calendar_month, color: Colors.blue),
                                SizedBox(width: 4),
                                Text('02 Feb', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About the Race',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'This is a detailed explanation about the event. It includes all the details such as race type, participants, rules, and any additional information.',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey.shade300, width: 1)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Price Text Aligned Right
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        '₹500',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'onwards',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),

                  // Register Button with Primary Border
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        side: const BorderSide(color: AppColors.primary, width: 2), // 🔹 Added Primary Border
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                    ),
                    onPressed: () {
                      context.push('/register');
                    },
                    child: const Text(
                      'Register',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
