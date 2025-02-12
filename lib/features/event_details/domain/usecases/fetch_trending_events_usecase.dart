/*import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../../event_details/domain/repositories/event_repository.dart';
import '../../data/models/event_model.dart';

class FetchTrendingEventsUseCase {
  final EventRepository eventRepository;

  FetchTrendingEventsUseCase({required this.eventRepository});

  /*Future<List<EventModel>> call() async {
    return await eventRepository.getTrendingEvents();
  }

   */
  Future<Either<Failure, Map<String, dynamic>>> call(int eventId) async {
    return await eventRepository.getTrendingEvents(eventId);
  }
}
*/
import 'package:india_running/features/home/data/repositories/event_repository_impl.dart';

import '../repositories/event_repository.dart';
import '../../data/models/event_model.dart';

class FetchTrendingEventsUseCase {
  final EventRepository eventRepository;

  FetchTrendingEventsUseCase(EventRepositoryImpl , {required this.eventRepository});

  Future<List<EventModel>> call() async {
    try {
      final trendingEvents = await eventRepository.getTrendingEvents();
      return trendingEvents;
    } catch (e) {
      throw Exception('Failed to fetch trending events.');
    }
  }
}








