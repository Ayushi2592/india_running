import '../../data/models/event_model.dart';

abstract class EventRepository {
  Future<List<EventModel>> getTrendingEvents();
  Future<List<EventModel>> fetchEvents();
}
