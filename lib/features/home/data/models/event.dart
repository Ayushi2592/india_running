class Event {
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
