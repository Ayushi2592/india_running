import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import '../models/trending_event_model.dart';
import '../../domain/repositories/trending_event_repository.dart';

class TrendingEventRepositoryImpl implements TrendingEventRepository {
  final http.Client client; 

  TrendingEventRepositoryImpl({required this.client}); 

  @override
  Future<Either<String, List<TrendingEventModel>>> getTrendingEvents() async {
    try {
      final response = await client.get(Uri.parse('')); 

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        final events = jsonData.map((e) => TrendingEventModel.fromJson(e)).toList();
        return Right(events);
      } else {
        return Left('Failed to fetch events. Status Code: ${response.statusCode}');
      }
    } catch (e) {
      return Left('Error fetching events: $e');
    }
  }
}
