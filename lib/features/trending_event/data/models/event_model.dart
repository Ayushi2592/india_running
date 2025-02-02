import '../../domain/entities/event_entity.dart';

class EventModel extends EventEntity {
  EventModel({required super.title, required super.location, required super.date, required super.imageUrl});

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      title: json['title'],
      location: json['location'],
      date: json['date'],
      imageUrl: json['imageUrl'],
    );
  }
}
