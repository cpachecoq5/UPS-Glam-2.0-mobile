import 'package:flutter/material.dart';

class PostCard extends StatelessWidget {
  final String username;
  final String description;
  final String imageUrl;

  const PostCard({
    super.key,
    required this.username,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Usuario
          ListTile(
            leading: const CircleAvatar(child: Icon(Icons.person)),
            title: Text(username, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: const Text('Hace 2h'), // esto puede reemplazarse con un timestamp
          ),
          // Imagen
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.zero, bottom: Radius.circular(16)),
            child: Image.network(imageUrl, width: double.infinity, height: 200, fit: BoxFit.cover),
          ),
          // Descripción
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(description),
          ),
          // Acciones
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: Row(
              children: const [
                Icon(Icons.favorite_border),
                SizedBox(width: 12),
                Icon(Icons.chat_bubble_outline),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
