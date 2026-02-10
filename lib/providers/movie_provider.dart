import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

// URL de la API en Render
const String apiUrl = 'API_URL';

class MovieProvider extends ChangeNotifier {
  // ApiService ahora recibe la baseUrl
  final ApiService apiService = ApiService();

  List<Movie> movies = [];
  bool loading = false;
  String? error;

  Future<void> loadMovies() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      // trae datos reales desde Render
      movies = await apiService.fetchListado();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
