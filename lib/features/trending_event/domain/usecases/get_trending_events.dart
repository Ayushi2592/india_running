import '../repositories/event_repository.dart';
import '../entities/event_entity.dart';

class GetTrendingEvents {
  final EventRepository repository;

  GetTrendingEvents(this.repository);

  Future<List<EventEntity>> call() async {
    final events = await repository.getTrendingEvents();
    print('Fetched events: $events');
    return events;
  }
}
