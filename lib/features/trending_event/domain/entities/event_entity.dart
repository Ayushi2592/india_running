class EventEntity {
  final String title;
  final String location;
  final String date;
  final String imageUrl;

  EventEntity({
    required this.title,
    required this.location,
    required this.date,
    required this.imageUrl,
  });

  get price => null;
}

