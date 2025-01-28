import '../../domain/entities/event.dart';

class EventModel extends Event {
  EventModel({
    required String image,
    required String race,
    required String location,
    required String cost,
  }) : super(image: image, race: race, location: location, cost: cost);

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      image: json['image'],
      race: json['race'],
      location: json['location'],
      cost: json['cost'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'race': race,
      'location': location,
      'cost': cost,
    };
  }
}
