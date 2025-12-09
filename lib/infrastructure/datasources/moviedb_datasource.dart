import 'package:dio/dio.dart';


import 'package:cinemapedia_220100/config/constants/environment.dart';
import 'package:cinemapedia_220100/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_220100/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_220100/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia_220100/domain/entities/movie.dart';
import 'package:cinemapedia_220100/infrastructure/models/moviedb/movie_details.dart';

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

  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response = await dio.get(
      '/movie/popular',
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

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get(
      '/movie/upcoming',
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

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get(
      '/movie/top_rated',
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

  @override
  Future<List<Movie>> getMexicanMovies({int page = 1}) async {
    final response = await dio.get(
      '/discover/movie',
      queryParameters: {
        'page': page,
        'region': 'MX',
        'with_original_language': 'es',
        'with_origin_country': 'MX',
        'sort_by': 'vote_average.desc',
        'vote_count.gte': 10,
      },
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

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
    final details = MovieDetails.fromJson(response.data);
    return MovieMapper.movieDetailsToEntity(details);
  }
  
  @override
  Future<List<Movie>> searchMovies(String query) async {
    if (query.isEmpty) return [];

    final response = await dio.get(
      '/search/movie',
      queryParameters: {'query': query},
    );

    final movieDBResponse = MovieDbResponse.fromJson(response.data);
    final List<Movie> movies = movieDBResponse.results
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .toList();

    return movies;
  }
}
