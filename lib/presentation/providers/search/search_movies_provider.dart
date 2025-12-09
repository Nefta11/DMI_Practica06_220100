import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220100/domain/entities/movie.dart';
import 'package:cinemapedia_220100/presentation/providers/movies/movies_repository_provider.dart';

final searchQueryProvider = Provider<String>((ref) => '');

final searchedMoviesProvider = NotifierProvider<SearchedMoviesNotifier, List<Movie>>(SearchedMoviesNotifier.new);

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchedMoviesNotifier extends Notifier<List<Movie>> {
  @override
  List<Movie> build() {
    return [];
  }

  Future<List<Movie>> searchMoviesByQuery(String query) async {
    final movieRepository = ref.read(movieRepositoryProvider);
    final List<Movie> movies = await movieRepository.searchMovies(query);

    state = movies;
    return movies;
  }
}
