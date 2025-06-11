import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/post.dart';

class PostService {
  static Future<List<Post>> fetchPosts() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Fehler beim Laden der Posts');
    }
  }
}
