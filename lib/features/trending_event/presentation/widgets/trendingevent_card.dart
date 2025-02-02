import 'package:flutter/material.dart';
import '../../domain/entities/event_entity.dart';

class EventCard extends StatelessWidget {
  final EventEntity event;

  const EventCard({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(event.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
        title: Text(event.title),
        subtitle: Text(event.location),
        trailing: Icon(Icons.arrow_forward),
      ),
    );
  }
}
