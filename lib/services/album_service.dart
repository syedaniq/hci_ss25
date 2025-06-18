import 'dart:convert';

import 'package:flutter_application_1/models/album.dart';
import 'package:http/http.dart' as irgendwas;

class AlbumService {
  static Future<List<Album>> fetchAlbums() async {
    final url = Uri.parse('http://jsonplaceholder.typicode.com/albums/');

    final response = await irgendwas.get(url, headers: {'User-Agent': 'useragent'});

    if (response.statusCode == 200) {
      final List jsonList = json.decode(response.body);
      return jsonList.map((e) => Album.fromJson(e)).toList();
    } else {
      print(response.statusCode);
      throw Exception('Ein Fehler ist aufgetreten');
    }
  }
}
