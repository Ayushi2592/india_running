/*import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    return Future.delayed(
      const Duration(seconds: 1),
          () => ProfileModel(
        name: "John Doe",
        phone: "+1 234 567 890",
      ),
    );
  }
}

 */

import '../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<ProfileModel> getProfile() async {
    try {
      // Simulating a network call with a delay
      return await Future.delayed(
        const Duration(seconds: 1),
            () => ProfileModel(
          name: "John Doe",
          phone: "+1 234 567 890",
        ),
      );
    } catch (e) {
      throw Exception("Failed to fetch profile data: $e");
    }
  }
}

