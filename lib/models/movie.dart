class Movie {
  final int id;
  final String titulo;
  final String director;
  final String imagen;
  final int year;
  final String genre;
  final double rating;
  bool favorite;


  Movie({
    required this.id,
    required this.titulo,
    required this.director,
    required this.imagen,
    required this.year,
    required this.genre,
    required this.rating,
    required this.favorite
  });

  // fromJson para cuando se conecte a la API y no a los mocks
  // factory Movie.fromJson(Map<String, dynamic> json) => Movie(
  //       id: json["id"],
  //       titulo: json["titulo"] ?? "",
  //       director: json["descripcion"] ?? "",
  //       imagen: json["imagen"] ?? "",
  //       activo: json["activo"] ?? false,
  //     );

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
    id: map['id'],
    titulo: map['title'] ?? "",
    director: map['director'] ?? "",
    imagen: map['image'] ?? "",
    year: map['year'] ?? "",
    rating: map['rating'],
    genre: map['genre'],
    favorite: map['favorite']
    );
  }
}
