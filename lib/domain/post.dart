class Post {
  String id;
  String title;
  String imageUrl;
  String userId;

  Post(
      {required this.id,
      required this.title,
      required this.imageUrl,
      required this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
