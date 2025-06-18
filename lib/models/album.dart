class Album {
  Album({required this.id, required this.title});

  final int id;
  final String title;

  Album.fromJson(Map<String, dynamic> json) : id = json['id'] as int, title = json['title'] as String;
}
