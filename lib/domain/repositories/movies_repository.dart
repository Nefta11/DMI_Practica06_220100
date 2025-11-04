import 'package:cinemapedia_220100/domain/entities/movie.dart';

// Clase abstracta que define el contrato del repositorio de películas.
// Se encarga de declarar los métodos que obtienen datos del datasource,
// en este caso, las películas que están en cartelera (Now Playing).
abstract class MoviesRepository {
  // Método que deberá implementarse para obtener la lista de películas actuales.
  // El parámetro [page] permite manejar la paginación de resultados.
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getMexicanMovies({int page = 1});
}
