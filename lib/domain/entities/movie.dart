// ENTIDAD DEL DOMINIO - Representa una película en nuestra aplicación
// Esta clase define la estructura de datos que usa la app internamente
// Es independiente de la API externa (Clean Architecture)
class Movie {
  final bool adult;           // Si la película es para adultos
  final String backdropPath;  // Imagen de fondo de la película
  final List<String> genreIds; // IDs de los géneros (acción, comedia, etc.)
  final int id;              // ID único de la película
  final String originalLanguage; // Idioma original
  final String originalTitle;    // Título original
  final String overview;         // Resumen/sinopsis de la película
  final double popularity;       // Puntuación de popularidad
  final String posterPath;       // Imagen del póster
  final DateTime releaseDate;    // Fecha de estreno
  final String title;           // Título en español
  final bool video;            // Si tiene video trailer
  final double voteAverage;    // Promedio de calificaciones
  final int voteCount;         // Número total de votos

  // Constructor que requiere todos los campos (inmutable)
  Movie({
    required this.adult,
    required this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
}
