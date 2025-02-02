import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event_model.dart';

class EventRemoteDataSource {
  Future<List<EventModel>> getTrendingEvents() async {
    final response = await http.get(Uri.parse('https://api.example.com/events'));
    final List data = json.decode(response.body);

    return data.map((e) => EventModel.fromJson(e)).toList();
  }
}
