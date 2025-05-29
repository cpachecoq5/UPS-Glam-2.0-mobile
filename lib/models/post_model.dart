class PostModel {
  final String id;
  final String title;
  final String content;

  PostModel({
    required this.id,
    required this.title,
    required this.content,
  });

  // Desde JSON (mapa)
  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['id'] ?? '',
      title: json['title'] ?? '',
      content: json['content'] ?? '',
    );
  }

  // A JSON (opcional, para envío a la API)
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
