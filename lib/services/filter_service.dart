import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart';

class FilterService {
  static const String baseUrl = 'http://10.0.2.2:8080/api/filter64'; // Cambia IP según entorno

  static Future<String> applyFilter(File imageFile, String filterType) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    if (token == null) {
      throw Exception('Usuario no autenticado');
    }

    final request = http.MultipartRequest('POST', Uri.parse(baseUrl))
      ..headers['Authorization'] = 'Bearer $token'
      ..fields['filter_type'] = filterType
      ..files.add(await http.MultipartFile.fromPath('file', imageFile.path));

    final response = await request.send();
    final responseBody = await response.stream.bytesToString();

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(responseBody);
      return data['imageBase64'];
    } else {
      throw Exception('Error al aplicar filtro: ${response.statusCode}');
    }
  }
}
