import '../../domain/entities/trending_event.dart';

class TrendingEventModel extends TrendingEvent {
  const TrendingEventModel({
    required super.id,
    required super.title,
    required super.location,
    required super.date,
    required super.imageUrl,
    required super.price,
    required super.rating,
  });

  factory TrendingEventModel.fromJson(Map<String, dynamic> json) {
    return TrendingEventModel(
      id: json['id'],
      title: json['title'],
      location: json['location'],
      date: json['date'],
      imageUrl: json['imageUrl'],
      price: json['price'].toDouble(),
      rating: json['rating'].toDouble(),
    );
  }
}
