import 'package:cinemapedia_matricula/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia_matricula/domain/entities/movie.dart';
import 'package:cinemapedia_matricula/domain/repositories/movies_repository.dart';

class MovieRepositoryImpl extends MoviesRepository {
  /// Fuente de datos que proporciona los métodos para obtener la información de películas.
  final MoviesDatasource datasource;

  /// Se recibe el datasource por el constructor para mantener la inyección de dependencias.
  MovieRepositoryImpl(this.datasource);

  /// Retorna la lista de películas que están actualmente en cartelera.
  /// Llama directamente al método `getNowPlaying` del datasource.
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }

  @override
  Future<List<Movie>> getPopular({int page = 1}) {
    return datasource.getPopular(page: page);
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) {
    return datasource.getUpcoming(page: page);
  }

  @override
  Future<List<Movie>> getTopRated({int page = 1}) {
    return datasource.getTopRated(page: page);
  }

  @override
  Future<List<Movie>> getMexicanMovies({int page = 1}) {
    return datasource.getMexicanMovies(page: page);
  }

  @override
  Future<Movie> getMovieById(String id) {
    return datasource.getMovieById(id);
  }
}
