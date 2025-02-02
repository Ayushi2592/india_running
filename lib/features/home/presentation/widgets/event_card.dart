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

import 'package:flutter/material.dart';

class EventCard extends StatelessWidget {
  final String eventName;
  final String eventLocation;
  final String eventPrice;
  final String eventImage;

  EventCard({
    required this.eventName,
    required this.eventLocation,
    required this.eventPrice,
    required this.eventImage, required event,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(eventImage, height: 150, width: double.infinity, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(eventName, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          Row(
            children: [
              Icon(Icons.location_on, size: 16, color: Colors.grey),
              Text(eventLocation),
              Spacer(),
              Text(eventPrice, style: TextStyle(color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}

