import 'package:cinemapedia_220100/domain/entities/movie.dart';

// Clase abstracta que define el contrato o estructura
// que debe seguir cualquier fuente de datos (datasource)
// que obtenga información de películas
abstract class MoviesDatasource {
  // Método que debe implementar la clase que herede de este datasource
  // Sirve para obtener una lista de películas que están en cartelera (Now Playing)
  // El parámetro [page] se usa para la paginación (por defecto empieza en 1)
  Future<List<Movie>> getNowPlaying({int page = 1});
  Future<List<Movie>> getPopular({int page = 1});
  Future<List<Movie>> getUpcoming({int page = 1});
  Future<List<Movie>> getTopRated({int page = 1});
  Future<List<Movie>> getMexicanMovies({int page = 1});
  // Obtiene una película individual por su ID
  Future<Movie> getMovieById(String id);
}
