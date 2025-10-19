import 'package:cinemapedia_220100/domain/entities/movie.dart';

// DATASOURCE ABSTRACTO - Define QUÉ operaciones podemos hacer con películas
// Es un contrato que cualquier fuente de datos debe implementar
// (puede ser API, base de datos local, caché, etc.)
abstract class MoviesDatasource {
  // Método para obtener películas en cartelera
  // Retorna una lista de películas y acepta número de página para paginación
  Future<List<Movie>> getNowPlaying({int page = 1});
}
