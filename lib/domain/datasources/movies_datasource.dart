import 'package:cinemapedia_220100/domain/entities/movie.dart';

// Clase abstracta que define el contrato o estructura
// que debe seguir cualquier fuente de datos (datasource)
// que obtenga información de películas
abstract class MoviesDatasource {

// Método que debe implementar la clase que herede de este datasource
// Sirve para obtener una lista de películas que están en cartelera (Now Playing)
// El parámetro [page] se usa para la paginación (por defecto empieza en 1)
Future<List<Movie>> getNowPlaying({ int page = 1 });

}
