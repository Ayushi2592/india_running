import 'package:dartz/dartz.dart';
import '../entities/trending_event.dart';
import '../repositories/trending_event_repository.dart';

class GetTrendingEvents {
  final TrendingEventRepository repository;

  GetTrendingEvents(this.repository);

  Future<Either<String, List<TrendingEvent>>> call() {
    return repository.getTrendingEvents();
  }
}
