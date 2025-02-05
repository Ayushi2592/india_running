import '../../../home/data/models/event.dart';

class EventModel extends Event {
  EventModel({
    required int id,
    required String name,
    required String title,
    required String location,
    required String date,
    required double price,
    required double cost,
    required double rating,
    required String race,
    required String description,
    required String image,
  }) : super(
    id: id,
    name: name,
    title: title,
    location: location,
    date: date,
    cost: cost.toString(),
    rating: rating,
    race: race,
    description: description,
    image: image,
  );

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as int,
      name: json['name'] as String,
      title: json['title'] as String,
      location: json['location'] as String,
      date: json['date'] as String,
      price: (json['price'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      race: json['race'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }

  get id => null;

  get description => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'location': location,
      'date': name,
      'price': name,
      'cost': cost,
      'rating': rating,
      'race': name,
      'description': description,
      'image': image,
    };
  }
}
