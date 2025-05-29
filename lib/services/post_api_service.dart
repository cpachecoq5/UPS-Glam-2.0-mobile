import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/post_model.dart';

class PostApiService {
  // Cambia esto por la URL de tu backend real
  static const String baseUrl = 'http://<TU_IP_O_DOMINIO>:8080/posts';

  /// Obtener todas las publicaciones
  static Future<List<PostModel>> fetchPosts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((item) => PostModel.fromJson(item)).toList();
    } else {
      throw Exception('Error al cargar publicaciones (${response.statusCode})');
    }
  }

  /// (Opcional) Crear una publicación
  static Future<void> createPost(PostModel post) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(post.toJson()),
    );

    if (response.statusCode != 201) {
      throw Exception('Error al crear publicación (${response.statusCode})');
    }
  }
}
