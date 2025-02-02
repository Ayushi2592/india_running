import 'package:flutter/material.dart';
import '../../domain/entities/trending_event.dart';

class TrendingEventCard extends StatelessWidget {
  final TrendingEvent event;

  const TrendingEventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(event.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(event.title),
        subtitle: Text(event.location),
        trailing: Text('₹${event.price}'),
      ),
    );
  }
}
