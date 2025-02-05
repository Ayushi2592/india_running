import '../../../../core/constants/app_constants.dart';
import '../../domain/repositories/event_repository.dart';
import '../../domain/entities/event_entities.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<List<Event>> fetchEvents() async {
    final List<Map<String, String>> eventData = [
      {'image': AppImages.poster1, 'cost': '₹525 onwards', 'distance': '2.5 km', 'location': 'New Delhi', 'race': 'Indian Navy Half Marathon'},
      {'image': AppImages.poster2, 'cost': '₹2500 onwards', 'distance': '1.8 km', 'location': 'Chandigarh', 'race': 'Chandigarh Fast Marathon'},
      {'image': AppImages.poster3, 'cost': '₹500 onwards', 'distance': '5 km', 'location': 'Amani Byrathikhane', 'race': 'Trail Adventure'},
      {'image': AppImages.poster4, 'cost': '₹30 onwards', 'distance': '3 km', 'location': 'Uptown', 'race': 'Night Run'},
      {'image': AppImages.poster5, 'cost': '₹10 onwards', 'distance': '0.8 km', 'location': 'Old Town', 'race': 'Fun Run'},
      {'image': AppImages.poster6, 'cost': '₹50 onwards', 'distance': '8 km', 'location': 'Outskirts', 'race': 'Ultra Marathon'},
    ];

    return Future.value(eventData.map((event) => Event(
      id: 0,
      name: event['race']!,
      title: event['race']!,
      location: event['location']!,
      cost: event['cost']!,
      image: event['image']!,
      date: "TBD",
      price: 0,
      rating: 0.0,
      description: "No description available", race: '',
    )).toList());
  }

  @override
  Future<List<Event>> getTrendingEvents() async {
    return fetchEvents();
  }
}
