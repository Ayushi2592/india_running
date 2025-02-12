

class Event {
  final String bannerImage;
  final String name;
  final String venue;
  final String minPrice;
  final String title;
  final int id;

  //var id;

  Event( {
    required this.id,
    required this.bannerImage,
    required this.name,
    required this.venue,
    required this.minPrice,
    required this.title, required date, required price, required rating, required description, required String location, String? startDate,
  });

  double get rating => 0.0;

  String get imageUrl => bannerImage;
}
