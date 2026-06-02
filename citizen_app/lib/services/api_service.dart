import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "http://localhost:5289/api";

  static Future<Map<String, dynamic>?> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse("$baseUrl/Auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": email,
        "password": password,
      }),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return null;
  }

  static Future<List<dynamic>> getTickets() async {
    final response = await http.get(
      Uri.parse("$baseUrl/Tickets"),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }

    return [];
  }

  static Future<bool> createTicket({
    required String title,
    required String description,
    required String category,
    required int userId,
  }) async {
    final response = await http.post(
      Uri.parse("$baseUrl/Tickets"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "title": title,
        "description": description,
        "category": category,
        "userId": userId,
      }),
    );

    return response.statusCode == 200 || response.statusCode == 201;
  }
}