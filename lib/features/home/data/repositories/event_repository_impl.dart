import '../../domain/entities/event.dart';
import '../../domain/repositories/event_repository.dart';
import '../models/event_model.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<List<Event>> fetchEvents() async {
    // Simulate fetching from a local source or API
    final data = [
      {'image': 'poster1.png', 'race': 'Indian Navy Half Marathon', 'location': 'New Delhi', 'cost': '₹525 onwards'},
      {'image': 'poster2.png', 'race': 'Chandigarh Fast Marathon', 'location': 'Chandigarh', 'cost': '₹2500 onwards'},
    ];
    return data.map((event) => EventModel.fromJson(event)).toList();
  }
}
