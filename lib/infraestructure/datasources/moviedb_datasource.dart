import 'package:dio/dio.dart'; // Cliente HTTP para hacer peticiones

import 'package:cinemapedia_220100/config/constants/environment.dart';
import 'package:cinemapedia_220100/domain/datasources/movies_datasource.dart';

import 'package:cinemapedia_220100/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia_220100/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:cinemapedia_220100/domain/entities/movie.dart';

// IMPLEMENTACIÓN CONCRETA del datasource para The Movie Database API
// Esta clase SÍ sabe cómo conectarse específicamente a TMDB
class MoviedbDatasource extends MoviesDatasource {

  // Configuración del cliente HTTP con URL base y parámetros por defecto
  final dio = Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',  // URL base de TMDB
    queryParameters: {
      'api_key': Environment.theMovieDbKey,   // API key desde .env
      'language': 'es-MX'                     // Idioma español-México
    }
  ));

  // Implementación del método para obtener películas en cartelera
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    
    // Hace la petición HTTP a la API de TMDB
    final response = await dio.get('/movie/now_playing');
    
    // Convierte la respuesta JSON a nuestro modelo de datos
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    // Filtra películas que tengan póster y las convierte a entidades de dominio
    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' ) // Solo películas con póster
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)     // Convierte de modelo API a entidad
    ).toList();

    return movies;
  }
}