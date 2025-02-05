/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is ProfileLoaded) {
            return Center(
              child: Column(
                children: [
                  Text(state.profile.name, style: const TextStyle(fontSize: 20)),
                  Text(state.profile.phone, style: const TextStyle(fontSize: 16)),
                ],
              ),
            );
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No Profile Loaded'));
        },
      ),
    );
  }
}*/



/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';

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

            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileLoaded) {
                  return Column(
                    children: [
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
                              child: Icon(Icons.person, size: 40, color: AppColors.primary),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.profile.name,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  state.profile.phone,
                                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      buildMenuContainer(context),
                      const SizedBox(height: 30),
                      buildMenuContainer(context),
                    ],
                  );
                } else if (state is ProfileError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('No Profile Loaded'));
              },
            ),
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
}*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_constants.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_state.dart';

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

            BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is ProfileLoaded) {
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              backgroundColor: AppColors.primaryLight,
                              radius: 30,
                              child: Icon(Icons.person, size: 40, color: AppColors.primary),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.profile.name,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  state.profile.phone,
                                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      buildMenuContainer1(context),
                      const SizedBox(height: 30),
                      buildMenuContainer2(context),
                    ],
                  );
                } else if (state is ProfileError) {
                  return Center(child: Text(state.message));
                }
                return const Center(child: Text('No Profile Loaded'));
              },
            ),
          ],
        ),
      ),
    );
  }

  /// First container remains unchanged
  Widget buildMenuContainer1(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          buildMenuItem(context, 'My Race', Icons.directions_run, '/my_race'),
          const SizedBox(height: 10),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 10),
          buildMenuItem(context, 'Certificates', Icons.emoji_events, '/certificates'),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 10),
          buildMenuItem(context, 'Race Photos', Icons.photo, '/race_photos'),
        ],
      ),
    );
  }

  /// Second container is updated with red Logout text and icon
  Widget buildMenuContainer2(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Column(
        children: [
          buildMenuItem(context, 'Account Details', Icons.person, '/account'),
          const SizedBox(height: 10),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 10),
          buildMenuItem(context, 'Account Settings', Icons.settings, '/accountsettings'),
          const Divider(height: 1, color: Colors.grey),
          const SizedBox(height: 10),
          buildLogoutItem(context),
        ],
      ),
    );
  }

  Widget buildLogoutItem(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push('/logout');
      },
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(Icons.logout, size: 22, color: Colors.red),
                SizedBox(width: 10),
                Text(
                  'Logout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.red),
                ),
              ],
            ),
            Icon(Icons.arrow_right, size: 20, color: Colors.red),
          ],
        ),
      ),
    );
  }

  Widget buildMenuItem(BuildContext context, String text, IconData icon, String route) {
    return InkWell(
      onTap: () {
        context.push(route);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(icon, size: 22, color: Colors.black),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const Icon(Icons.arrow_right, size: 20, color: Colors.black),
          ],
        ),
      ),
    );
  }
}
