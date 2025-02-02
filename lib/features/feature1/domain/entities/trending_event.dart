class TrendingEvent {
  final String id;
  final String title;
  final String location;
  final String date;
  final String imageUrl;
  final double price;
  final double rating;

  const TrendingEvent({
    required this.id,
    required this.title,
    required this.location,
    required this.date,
    required this.imageUrl,
    required this.price,
    required this.rating,
  });
}
