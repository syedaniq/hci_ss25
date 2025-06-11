class Post {
  Post({required this.id, required this.title});

  final int id;
  final String title;

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(id: json['id'], title: json['title']);
  }
}
