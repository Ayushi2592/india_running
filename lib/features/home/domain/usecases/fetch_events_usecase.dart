//import 'package:india_running/features/home/domain/repositories/event_repository.dart';
//import 'package:india_running/features/home/domain/entities/event_entities.dart';


//class FetchEventsUseCase {
  //final EventRepository repository;

  //FetchEventsUseCase(this.repository, {required  eventRepository});

  //Future<List<Event>> call() async {
    //return eventRepository.fetchEvents();
  //}
//}

/*import 'package:india_running/features/home/domain/entities/event_entities.dart';
import 'package:india_running/features/home/domain/repositories/event_repository.dart';

class FetchEventsUseCase {
  final EventRepository eventRepository;
  FetchEventsUseCase(this.eventRepository);

  Future<List<Event>> call() async {
    return await eventRepository.fetchEvents();
  }
}

 */



import 'package:india_running/features/home/domain/entities/event_entities.dart';

import '../repositories/event_repository.dart';

class FetchEventsUseCase {
  final EventRepository repository;

  FetchEventsUseCase(this.repository);

  Future<List<Event>> call() async {
    return await repository.fetchEvents();
  }
}



