import 'package:dio/dio.dart';

import 'package:cinemapedia_220100/config/constants/environment.dart';
import 'package:cinemapedia_220100/domain/datasources/movies_datasource.dart';

import 'package:cinemapedia_220100/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_220100/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia_220100/domain/entities/movie.dart';

// Esta clase implementa el datasource usando la API de The Movie Database (TMDB).
// Se conecta al servicio externo para obtener las películas que están en cartelera.
class MoviedbDatasource extends MoviesDatasource {
  // Se crea una instancia de Dio con la configuración base de la API.
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  // Método que obtiene la lista de películas actualmente en cartelera (Now Playing)
  // Hace la petición HTTP a la API, transforma los datos y devuelve una lista de Movie.
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response = await dio.get(
      '/movie/now_playing',
      queryParameters: {'page': page},
    );
    final movieDBResponse = MovieDbResponse.fromJson(
      response.data,
    ); // Se parsea la respuesta

    // Se filtran películas sin póster y se transforman en entidades Movie
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies; // Devuelve la lista final de películas
  }
}
