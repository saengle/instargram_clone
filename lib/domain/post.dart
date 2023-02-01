class Post {
  String title;
  String imageUrl;
  String userId;

  Post({required this.title, required this.imageUrl, required this.userId});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      userId: json['userId'] as String,
      title: json['title'] as String,
      imageUrl: json['imageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'title': title,
      'imageUrl': imageUrl,
    };
  }
}
