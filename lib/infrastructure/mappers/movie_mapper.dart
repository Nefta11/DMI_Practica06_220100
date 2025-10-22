import 'package:cinemapedia_220100/domain/entities/movie.dart';
import 'package:cinemapedia_220100/infrastructure/models/moviedb/movie_moviedb.dart';

// Clase encargada de transformar (mapear) los datos obtenidos desde la API de MovieDB
class MovieMapper {

// Convierte un objeto MovieMovieDB (modelo de la API) en un objeto Movie (entidad del dominio).
// También agrega URLs completas para las imágenes y valores por defecto si faltan datos.
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
        ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath }'
        : 'https://sd.keepcalms.com/i-w600/keep-calm-poster-not-found.jpg',
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '')
        ? '[https://image.tmdb.org/t/p/w500${ moviedb.posterPath }'
        : 'no-poster',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount
    );
}
