import '../../domain/entities/event_entity.dart';
import '../../domain/repositories/event_repository.dart';
import '../data_sources/event_remote_data_source.dart';

class EventRepositoryImpl implements EventRepository {
  final EventRemoteDataSource dataSource;

  EventRepositoryImpl(this.dataSource);

  @override
  Future<List<EventEntity>> getTrendingEvents() async {
    return await dataSource.getTrendingEvents();
  }
}
