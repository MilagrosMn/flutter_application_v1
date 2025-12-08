import 'package:flutter/material.dart';
import '../models/movie.dart';
import '../services/api_service.dart';

class MovieProvider extends ChangeNotifier {
  final ApiService apiService = ApiService();

  List<Movie> movies = [];
  bool loading = false;
  String? error;

  Future<void> loadMovies() async {
    loading = true;
    error = null;
    notifyListeners();

    // por el momento, fetchListado devolverá los mocks
    try {
      movies = await apiService.fetchListado();
    } catch (e) {
      error = e.toString();
    }

    loading = false;
    notifyListeners();
  }
}
