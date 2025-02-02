import 'package:dartz/dartz.dart';
import '../entities/trending_event.dart';

abstract class TrendingEventRepository {
  Future<Either<String, List<TrendingEvent>>> getTrendingEvents();
}