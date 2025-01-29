import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../app_constants.dart';

class ReviewDetailsScreen extends StatefulWidget {
  const ReviewDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ReviewDetailsScreen> createState() => _ReviewDetailsScreenState();
}

class _ReviewDetailsScreenState extends State<ReviewDetailsScreen> {
  bool _showPersonalFields = false;
  bool _showTimingFields = false;
  bool _showAdditionalFields = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Circle Avatar with Back Icon and Title
            Row(
              children: [
                IconButton(
                  icon: CircleAvatar(
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
                const SizedBox(width: 16),
                const Expanded(
                  child: Text(
                    'Review Details',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Rectangular Curved Box
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
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        AppImages.image3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Indian Navy Half Marathon',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          '5K',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: const [
                            Icon(Icons.location_on, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                'Mumbai, India',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                            SizedBox(width: 4),
                            Text(
                              '12th March 2025',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Personal Information Section
            _buildSection(
              title: 'Personal Information',
              showFields: _showPersonalFields,
              onToggle: () {
                setState(() {
                  _showPersonalFields = !_showPersonalFields;
                });
              },
              fields: [
                'First Name',
                'Last Name',
                'Email ID',
                'Phone Number',
                'Date of Birth',
                'Gender',
                'Address',
                'Pincode'
              ],
            ),
            const SizedBox(height: 10),
            _buildPendingButton(),
            const Divider(thickness: 1, color: Colors.grey),
            // Timing Details Section
            _buildSection(
              title: 'Timing Details',
              showFields: _showTimingFields,
              onToggle: () {
                setState(() {
                  _showTimingFields = !_showTimingFields;
                });
              },
              fields: [
                'Start Time',
                'End Time',
                'Duration',
              ],
            ),
            const SizedBox(height: 10),
            _buildPendingButton(),
            const Divider(thickness: 1, color: Colors.grey),
            // Additional Information Section
            _buildSection(
              title: 'Additional Information',
              showFields: _showAdditionalFields,
              onToggle: () {
                setState(() {
                  _showAdditionalFields = !_showAdditionalFields;
                });
              },
              fields: [
                'Comments',
                'Special Requests',
              ],
            ),
            const SizedBox(height: 10),
            _buildPendingButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required bool showFields,
    required VoidCallback onToggle,
    required List<String> fields,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            IconButton(
              icon: Icon(
                showFields ? Icons.remove : Icons.add,
                color: Colors.lightBlue,
              ),
              onPressed: onToggle,
            ),
          ],
        ),
        if (showFields)
          ...fields
              .map((field) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: _buildTextField(field),
          ))
              .toList(),
      ],
    );
  }

  Widget _buildTextField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red, width: 2),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      ),
    );
  }

  Widget _buildPendingButton() {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.yellow.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Text(
          'Pending',
          style: TextStyle(
            color: Colors.yellow,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
