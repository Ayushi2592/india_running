import '../../../event_details/domain/repositories/event_repository.dart';
import '../../data/models/event_model.dart';

class FetchTrendingEventsUseCase {
  final EventRepository eventRepository;

  FetchTrendingEventsUseCase({required this.eventRepository});

  Future<List<EventModel>> call() async {
    return await eventRepository.getTrendingEvents();
  }
}








