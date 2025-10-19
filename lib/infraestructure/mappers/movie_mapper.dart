import 'package:cinemapedia_220100/domain/entities/movie.dart';
import 'package:cinemapedia_220100/infraestructure/models/moviedb/movie_moviedb.dart';

// MAPPER - Convierte datos de la API externa a nuestras entidades internas
// Esto permite que si cambia la API, solo modificamos el mapper, no toda la app
class MovieMapper {
  // Convierte un objeto de la API de TMDB a nuestra entidad Movie
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
    adult: moviedb.adult,
    
    // Construye la URL completa de la imagen de fondo
    // Si no tiene imagen, usa una imagen por defecto
    backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
    
    // Convierte los IDs de género de int a String para nuestra entidad
    genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
    id: moviedb.id,
    originalLanguage: moviedb.originalLanguage,
    originalTitle: moviedb.originalTitle,
    overview: moviedb.overview,
    popularity: moviedb.popularity,
    
    // Construye la URL completa del póster
    // Si no tiene póster, marca como 'no-poster'
    posterPath: (moviedb.posterPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
        : 'no-poster',
    releaseDate: moviedb.releaseDate,
    title: moviedb.title,
    video: moviedb.video,
    voteAverage: moviedb.voteAverage,
    voteCount: moviedb.voteCount,
  );
}
