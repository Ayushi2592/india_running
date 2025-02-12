import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';





class RaceKit extends StatefulWidget {
  const RaceKit({super.key});

  @override
  _RaceKitState createState() => _RaceKitState();
}

class _RaceKitState extends State<RaceKit> {
  Map<String, String> userDetails = {
    "T-shirt Size": "--",
  };
  bool isLoading = true;
  bool hasError = false;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      final response = await http.get(Uri.parse(
          'https://92a2-2407-3e40-11-cfce-3c62-fc1-70ec-a1b4.ngrok-free.app/userProfile/6'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        setState(() {
          userDetails = {
            "T-shirt Size": data['tshirtsize'] ?? "--",
          };
          isLoading = false;
        });
      } else {
        setState(() {
          hasError = true;
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  }

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
                    'Race Kit Shirt Size',
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
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : hasError
                ? const Center(
              child: Text(
                'Failed to load data. Please try again.',
                style: TextStyle(color: Colors.red),
              ),
            )
                : buildUserInfoContainer(),
          ],
        ),
      ),
    );
  }

  Widget buildUserInfoContainer() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: userDetails.entries.map((entry) {
          return buildVerticalInfo(entry.key, entry.value);
        }).toList(),
      ),
    );
  }

  Widget buildVerticalInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
