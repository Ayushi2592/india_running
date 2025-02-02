import '../../domain/entities/event.dart';

class EventModel extends Event {
  EventModel({
    required String image,
    required String race,
    required String location,
    required String cost,
    required String title,
  }) : super(
    image: image,
    race: race,
    location: location,
    cost: cost,
    title: title,
  );

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      image: json['image'],
      race: json['race'],
      location: json['location'],
      cost: json['cost'],
      title: json['title'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'race': race,
      'location': location,
      'cost': cost,
      'title': title,
    };
  }
}
