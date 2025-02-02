import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/register_model.dart';

class RegisterRemoteDataSource {
  Future<bool> registerUser(RegisterModel user) async {
    final response = await http.post(
      Uri.parse('https://api.example.com/register'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(user.toJson()),
    );

    return response.statusCode == 201;
  }
}
