import '../../../home/data/models/event.dart';

class EventModel extends Event {
  EventModel({
    required int id,
    required String name,
    required String venue,
    required String startDate,
    required double minPrice,
    required double cost,
    required double rating,
    required String race,
    required String description,
    required String bannerImage,
  }) : super(
    id: id,
    name: name,
    venue: venue,
    startDate: startDate,
    minPrice: minPrice,
    rating: rating,
    description: description,
    bannerImage: bannerImage,
  );

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'] as int,
      name: json['name'] as String,
      venue: json['venue'] as String,
      startDate: json['start_date'] as String,
      minPrice: (json['minPrice'] as num).toDouble(),
      cost: (json['cost'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      race: json['race'] as String,
      description: json['description'] as String,
      bannerImage: json['bannerImage'] as String,
    );
  }


  get description => null;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'venue': venue,
      'date': name,
      'price': name,
      'cost': minPrice,
      'rating': rating,
      'race': name,
      'description': description,
      'bannerImage': bannerImage,
    };
  }
}


/*class EventModel {
  final int id;
  final String name;
  final String location;
  final String date;
  final double price;
  final double rating;
  final String description;
  final String image;
  final String title;
  final double cost;
  final String race;

  EventModel({
    required this.id,
    required this.name,
    required this.location,
    required this.date,
    required this.price,
    required this.rating,
    required this.description,
    required this.image,
    required this.title,
    required this.cost,
    required this.race,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) {
    return EventModel(
      id: json['id'],
      name: json['name'],
      location: json['location'],
      date: json['date'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
      description: json['description'],
      image: json['image'],
      title: json['title'],
      cost: json['cost'].toDouble(),
      race: json['race'],
    );
  }
}

 */

