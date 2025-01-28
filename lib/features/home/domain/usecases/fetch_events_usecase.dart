//import '../entities/event.dart';
//import '../repositories/event_repository.dart';

//class FetchEventsUseCase {
  //final EventRepository repository;

  //FetchEventsUseCase(this.repository);

  //Future<List<Event>> call() async {
    //return await repository.fetchEvents();
  //}
//}


class FetchEventsUseCase {
  FetchEventsUseCase();

  Future<List<String>> call() async {
    // Simulate fetching events (replace with your actual logic)
    await Future.delayed(const Duration(seconds: 2));
    return ['Event 1', 'Event 2', 'Event 3'];
  }
}

