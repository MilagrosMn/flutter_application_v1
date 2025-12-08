//import 'dart:convert';
import 'dart:async';
//import 'dart:io';
//import 'package:http/http.dart' as http;
import '../mocks/peliculas.dart';
//import '../utils/constants.dart';
import '../models/movie.dart';

class ApiService {
  //final String baseUrl = Constants.baseUrl;

  Future<List<Movie>> fetchListado() async {
    //try {
      // comentado para cuando se conecte a la API
      // final url = Uri.parse('$baseUrl/api/v1/peliculas');
      // final res = await http.get(url).timeout(const Duration(seconds: 10));

      // if (res.statusCode != 200) {
      //   throw Exception("Error ${res.statusCode}");
      // }

      // final List data = jsonDecode(res.body);
      await Future.delayed(const Duration(seconds: 1)); // simula conexión con API
      return peliculas.map((e) => Movie.fromMap(e)).toList();
    // } on TimeoutException {
    //   throw Exception("Tiempo de espera agotado.");
    // } on SocketException {
    //   throw Exception("Sin conexión.");
   }
  

  Future<Movie> fetchDetalle(int id) async {
    // try {
    //   final url = Uri.parse('$baseUrl/api/v1/peliculas/$id');
    //   final res = await http.get(url).timeout(const Duration(seconds: 10));

    //   if (res.statusCode != 200) throw Exception("Error al cargar");

    //   return Movie.fromJson(jsonDecode(res.body));
    // } on TimeoutException {
    //   throw Exception("Timeout");
    // } on SocketException {
    //   throw Exception("Sin conexión");
    // }
    await Future.delayed(const Duration(milliseconds: 500));

    final map = peliculas.firstWhere(
      (p) => p['id'] == id,
      orElse: () => throw Exception("Película no encontrada")
    );
    return Movie.fromMap(map);
  }
}
