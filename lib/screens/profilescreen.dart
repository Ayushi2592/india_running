import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primaryLight,
                    child: Icon(
                      Icons.arrow_back,
                      size: 20,
                      color: AppColors.primary,
                    ),
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
                const Expanded(
                  child: Text(
                    'Profile',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Divider(thickness: 0.5, color: Colors.grey),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Profile Container
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundColor: AppColors.primaryLight,
                    radius: 30,
                    child: Icon(Icons.person, size: 40, color : AppColors.primary),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ayushi Singh',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '9523322435',
                        style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Menu Container 1
            buildMenuContainer(context),

            const SizedBox(height: 30),

            buildMenuContainer(context),
          ],
        ),
      ),
    );
  }

  Widget buildMenuContainer(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          buildMenuItem(context, 'My Race', '/my_race'),
          const SizedBox(height: 10),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 10),
          buildMenuItem(context, 'Certificates', '/certificates'),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 10),
          buildMenuItem(context, 'Race Photos', '/race_photos'),
        ],
      ),
    );
  }


  Widget buildMenuItem(BuildContext context, String text, String route) {
    return InkWell(
      onTap: () {
        context.push(route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            const Icon(Icons.arrow_right, size: 20, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
