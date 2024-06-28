import 'dart:convert';
import 'package:http/http.dart' as http;
import 'learning_style_request.dart';

Future<String?> fetchLearningStyle(LearningStyleRequest request) async {
  final url = Uri.parse('http://127.0.0.1:5000/predict'); // Update with your Flask server address
  final response = await http.post(
    url,
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(request.toJson()),
  );

  if (response.statusCode == 200) {
    final data = jsonDecode(response.body);
    return data['learning_style'];
  } else {
    return null;
  }
}
