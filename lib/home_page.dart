import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/post.dart';
import 'package:flutter_application_1/services/post_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Post>> futurePosts;

  @override
  void initState() {
    super.initState();
    futurePosts = PostService.fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurePosts,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          for (final post in snapshot.data!) {
            return Text(post.title);
          }
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return CircularProgressIndicator();
      },
    );
  }
}
