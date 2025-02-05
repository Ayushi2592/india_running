import 'package:india_running/core/constants/app_constants.dart';

import '../../../event_details/domain/repositories/event_repository.dart';
import '../models/event_model.dart';

class EventRepositoryImpl implements EventRepository {
  @override
  Future<List<EventModel>> getTrendingEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      EventModel(
        id: 1,
        name: 'India Navy',
        location: 'Location',
        date: '02 Feb',
        price: 500,
        rating: 4.5,
        description: 'Event Description',
        image: AppImages.poster5,
        title: '',
        cost: 500.0,
        race: '',
      ),
    ];
  }

  @override
  Future<List<EventModel>> fetchEvents() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      EventModel(
        id: 2,
        name: 'Marathon Run',
        location: 'Delhi',
        date: '10 Feb',
        price: 750,
        rating: 4.2,
        description: 'Marathon event in Delhi',
        image: AppImages.poster4,
        title: '',
        cost: 750.0,
        race: '',
      ),
    ];
  }
}
