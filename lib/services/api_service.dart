import 'dart:convert';
import 'dart:async';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;

import '../models/movie.dart';

class ApiService {
    final String? baseUrl = dotenv.env['API_URL'];

    ApiService() {
      if (baseUrl == null) {
        print('ERROR: variable de entorno API_URL no encontrada');
      } else {
        print('API conectada: $baseUrl');
      }
    }

    /// listado de peliculas
    Future<List<Movie>> fetchListado() async {
      if (baseUrl == null) {
        throw Exception('API_URL no configurada');
      }

      final url = Uri.parse('$baseUrl/peliculas');
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final List<dynamic> data = json['data'] ?? [];
        return data.map((e) => Movie.fromMap(e)).toList();
      } else {
        throw Exception('Error: failed to fetch movies');
      }
    }

    /// id peli
    Future<Movie> fetchDetalle(int id) async {
      if (baseUrl == null) {
        throw Exception('API_URL no configurada');
      }

      final url = Uri.parse('$baseUrl/peliculas/$id');
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final Map<String, dynamic> json = jsonDecode(response.body);
        final Map<String, dynamic> data = json['data'];
        return Movie.fromMap(data);
      } else {
        throw Exception('Error: failed to fetch movie');
      }
    }
  }