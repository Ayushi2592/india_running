import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../../data/models/event_model.dart';

abstract class EventRepository {
  Future<List<EventModel>> getTrendingEvents();
  Future<List<EventModel>> fetchEvents();
  Future<Either<Failure, Map<String, dynamic>>> getEventDetails(String eventId);
}
