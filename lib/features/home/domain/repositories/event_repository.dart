import '../../domain/entities/event_entities.dart';

abstract class EventRepository {
  Future<List<Event>> fetchEvents();
  Future<List<Event>> getTrendingEvents();
}
