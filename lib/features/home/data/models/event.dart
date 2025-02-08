/*class Event {
  final String name;
  final String location;
  final String cost;
  final String image;
  final int? id;
  final String? date;
  final int? price;
  final double? rating;
  final String? description;

  Event({
    required this.name,
    required this.location,
    required this.cost,
    required this.image,
    this.id,
    this.date,
    this.price,
    this.rating,
    this.description, required String title, required String race,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
      location: json['location'],
      cost: json['cost'],
      image: json['image'],
      id: json['id'],
      date: json['date'],
      price: json['price'],
      rating: json['rating'],
      description: json['description'], title: '', race: '',
    );
  }
}

 */
class Event {
  final int id;
  final String name;
  final String venue;
  final String bannerImage;
  final String? startDate;
  final double? minPrice;
  final double? rating;
  final String? description;

  Event({
    required this.id,
    required this.name,
    required this.venue,
    required this.bannerImage,
    this.startDate,
    this.minPrice,
    this.rating,
    this.description,
  });

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'] ?? 0,
      name: json['name'] ?? 'Unknown',
      venue: json['venue'] ?? 'Unknown',
      bannerImage: json['banner_image'] ?? '',
      startDate: json['start_date'],
      minPrice: json['minPrice'] != null ? (json['minPrice'] as num).toDouble() : null,
      rating: json['rating'] != null ? (json['rating'] as num).toDouble() : null,
      description: json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'venue': venue,
      'banner_image': bannerImage,
      'start_date': startDate,
      'minPrice': minPrice,
      'rating': rating,
      'description': description,
    };
  }
}

