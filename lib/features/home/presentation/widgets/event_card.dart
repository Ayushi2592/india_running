//import 'package:flutter/material.dart';

//class EventCard extends StatelessWidget {
  //final String event;

  //const EventCard({required this.event, Key? key}) : super(key: key);

  //@override
  //Widget build(BuildContext context) {
    //return Card(
      //margin: const EdgeInsets.all(8.0),
      //child: Padding(
        //padding: const EdgeInsets.all(16.0),
        //child: Row(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //children: [
            //Text(
              //event,
              //style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //),
            //Icon(Icons.event),
          //],
        //),
      //),
    //);
  //}
//}


////////////////////////////////////////////////////////////////////////////////////////////////////////////////
import 'package:flutter/material.dart';
import 'package:india_running/features/home/domain/entities/event_entities.dart';

class EventCard extends StatelessWidget {
  final int eventId;
  final String eventName;
  final String eventVenue;
  //final double eventminPrice;
  final String eventbannerImage;

  EventCard({
    required this.eventId,
    required this.eventName,
    required this.eventVenue,
    //required this.eventminPrice,
    required this.eventbannerImage, required Event event,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Use Image.network for online images
          Image.network(eventbannerImage, height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              eventName,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              Text(eventVenue),
              Spacer(),
              //Text(
                //'\$${eventminPrice.toStringAsFixed(2)}',
                //style: TextStyle(color: Colors.green),
              //),
            ],
          ),
        ],
      ),
    );
  }
}

