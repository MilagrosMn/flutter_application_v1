class Movie {
  final int id;
  final String titulo;
  final int anio;
  final List<int> generoIds;
  final String overview;
  final String poster;
  bool favorite;

  Movie({
    required this.id,
    required this.titulo,
    required this.anio,
    required this.generoIds,
    required this.overview,
    required this.poster,
    this.favorite = false,
  });

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'] ?? 0,
      titulo: map['titulo'] ?? '',
      anio: map['anio'] ?? 0,
      generoIds: map['genero_ids'] != null
          ? List<int>.from(map['genero_ids'])
          : [],
      overview: map['overview'] ?? '',
      poster: map['poster'] ?? '',
      favorite: map['favorita'] ?? false,
    );
  }

  int get year => anio;

  List<int> get genreIds => generoIds;

  String get imagen => poster;

  String get director => overview; 

  String get genre => generoIds.join(', ');
}
