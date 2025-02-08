/*import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';


abstract class HomeRemoteDataSource {
  Future<List<Event>> fetchEvents();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl(this.client, {required });
  @override
  Future<List<Event>> fetchEvents() async {
    final response = await client.get(Uri.parse('https://92a2-2407-3e40-11-cfce-3c62-fc1-70ec-a1b4.ngrok-free.app/events'));
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((e) => Event.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load events');
    }
  }
}

 */

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

abstract class HomeRemoteDataSource {
  Future<List<Event>> fetchEvents();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl(this.client);

  @override
  Future<List<Event>> fetchEvents() async {
    final response = await client.get(Uri.parse(
        'https://92a2-2407-3e40-11-cfce-3c62-fc1-70ec-a1b4.ngrok-free.app/events'));

    //print('Status Code: ${response.statusCode}');
    //print('Response Body: ${response.body}');

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonData = json.decode(response.body);
      if (jsonData['data'] != null) {
        final List<dynamic> eventList = jsonData['data'];
        return eventList.map((e) => Event.fromJson(e)).toList();
      } else {
        throw Exception("No events found in the response.");
      }
    } else {
      throw Exception(
          'Failed to load events. Status code: ${response.statusCode}, Response body: ${response.body}');
    }
  }
}





/*import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

abstract class HomeRemoteDataSource {
  Future<List<Event>> fetchHomeEvents();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final http.Client client;

  HomeRemoteDataSourceImpl({required this.client});

  @override
  Future<List<Event>> fetchHomeEvents() async {
    final url = Uri.parse('https://92a2-2407-3e40-11-cfce-3c62-fc1-70ec-a1b4.ngrok-free.app/events');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((event) => Event.fromJson(event)).toList();
    } else {
      throw Exception('Failed to fetch events');
    }
  }
}

 */

