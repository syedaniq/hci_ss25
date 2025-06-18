import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/album_service.dart';
import 'package:flutter_application_1/widgets/studi_container.dart';

import '../models/album.dart';

class AlbumPage extends StatefulWidget {
  const AlbumPage({super.key});

  @override
  State<AlbumPage> createState() => _AlbumPageState();
}

class _AlbumPageState extends State<AlbumPage> {
  late Future<List<Album>> futureAlbums;

  @override
  void initState() {
    super.initState();
    futureAlbums = AlbumService.fetchAlbums();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: futureAlbums,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                for (final album in snapshot.data!)
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: StudiContainer(name: album.title, uni: album.id.toString()),
                  ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Ein Fehler ist aufgetreten ${snapshot.stackTrace}'));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
