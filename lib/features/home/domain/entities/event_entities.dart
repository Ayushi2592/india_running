class Event {
  final String image;
  final String race;
  final String location;
  final String cost;
  final String title;

  Event({
    required this.image,
    required this.race,
    required this.location,
    required this.cost,
    required this.title, required id, required name, required date, required price, required rating, required description,
  });

  double get rating => 0.0;

  String get imageUrl => image;
}
