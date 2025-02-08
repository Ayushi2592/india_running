import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';

class AccountDetailsScreen extends StatelessWidget {
  const AccountDetailsScreen({super.key});

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
                    'Account Detail',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            const Divider(thickness: 0.5, color: Colors.black87),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 0.5),
                borderRadius: BorderRadius.circular(22),
              ),
              child: Column(
                children: [
                  buildListItem(context, 'Personal Information', Icons.person,
                      '/personalinfo'),
                  buildDivider(),
                  buildListItem(
                      context, 'Address', Icons.location_on, '/address'),
                  buildDivider(),
                  buildListItem(context, 'Emergency Details', Icons.warning,
                      '/emergency_details'),
                  buildDivider(),
                  buildListItem(context, 'Physical Measurements',
                      Icons.fitness_center, '/physical_measurements'),
                  buildDivider(),
                  buildListItem(
                      context, 'Race Kit', Icons.backpack, '/race_kit'),
                  buildDivider(),
                  buildListItem(context, 'Timing Certificate', Icons.timer,
                      '/timing_certificate'),
                  buildDivider(),
                  buildListItem(
                      context, 'Documents', Icons.file_copy, '/documents'),
                  Column()    
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds each row with an icon, text, and back arrow
  Widget buildListItem(
      BuildContext context, String title, IconData icon, String route) {
    return InkWell(
      onTap: () {
        context.push(route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 22, color: AppColors.primary),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Icon(Icons.arrow_forward_ios,
                size: 16, color: AppColors.primary),
          ],
        ),
      ),
    );
  }

  /// Divider between items
  Widget buildDivider() {
    return const Divider(height: 1, color: Colors.grey);
  }
}
