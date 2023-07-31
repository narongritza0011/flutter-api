import 'dart:convert';
import 'package:http/http.dart' as http;
//all to api call will be here

class TodoService {
  static Future<bool> deleteById(String id) async {
    const url = "https://www.melivecode.com/api/users/delete";
    final uri = Uri.parse(url);
    final body = {"id": id};
    final response = await http.delete(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  static Future<List?> fetchTodos() async {
    const url = 'https://www.melivecode.com/api/users';
    final uri = Uri.parse(url);
    final response = await http.get(
      uri,
    );
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json;
    } else {
      return null;
    }
  }

  static Future<bool> updateTodo(Map data) async {
    final url = 'https://www.melivecode.com/api/users/update';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );
    return response.statusCode == 200;
  }

  static Future<bool> submitData(Map data) async {
    final url = 'https://www.melivecode.com/api/users/create';
    final uri = Uri.parse(url);

    // print(data);
    final response = await http.post(
      uri,
      body: jsonEncode(data),
      headers: {'Content-Type': 'application/json'},
    );

    return response.statusCode == 200;
  }
}
