import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220100/domain/entities/movie.dart';
import 'package:cinemapedia_220100/presentation/providers/movies/movies_repository_provider.dart';
import 'package:cinemapedia_220100/domain/repositories/movies_repository.dart';

// Estado: Map<String, Movie> donde la llave es el id de la película
final movieInfoProvider = NotifierProvider<MovieInfoNotifier, Map<String, Movie>>(MovieInfoNotifier.new);

class MovieInfoNotifier extends Notifier<Map<String, Movie>> {
  late MoviesRepository repository;

  @override
  Map<String, Movie> build() {
    repository = ref.watch(movieRepositoryProvider);
    return {};
  }

  Future<void> loadMovie(String id) async {
    if (state[id] != null) return; // Ya cargada
    final movie = await repository.getMovieById(id);
    state = {...state, id: movie};
  }
}
