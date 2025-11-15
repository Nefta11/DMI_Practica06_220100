import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_matricula/presentation/providers/providers.dart';
import 'package:cinemapedia_matricula/domain/entities/movie.dart';
import 'package:cinemapedia_matricula/presentation/providers/movies/movies_repository_provider.dart';

// 🔹 1. Definimos el tipo de función callback
typedef MovieCallback = Future<List<Movie>> Function({int page});


// 🔹 2. Provider principal
final nowPlayingMoviesProvider =
    NotifierProvider<NowPlayingMoviesNotifier, List<Movie>>(
  NowPlayingMoviesNotifier.new,
);

final popularMoviesProvider =
    NotifierProvider<PopularMoviesNotifier, List<Movie>>(
  PopularMoviesNotifier.new,
);

final upcomingMoviesProvider =
    NotifierProvider<UpcomingMoviesNotifier, List<Movie>>(
  UpcomingMoviesNotifier.new,
);

final topRatedMoviesProvider =
    NotifierProvider<TopRatedMoviesNotifier, List<Movie>>(
  TopRatedMoviesNotifier.new,
);

final mexicanMoviesProvider =
    NotifierProvider<MexicanMoviesNotifier, List<Movie>>(
  MexicanMoviesNotifier.new,
);




// 🔹 3. El Notifier que maneja el estado
class MoviesNotifier extends Notifier<List<Movie>> {
  int currentPage = 0;
  late final MovieCallback fetchMoreMovies;
  bool isLoading = false;

  @override
  List<Movie> build() {
    // Por defecto no asignamos un callback aquí; las subclases
    // deben asignar el método correcto del repositorio en su build().
    return [];
  }

  Future<void> loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    currentPage++;
    final movies = await fetchMoreMovies(page: currentPage);

    state = [...state, ...movies];

    isLoading = false;
  }
}

// Concrete Notifiers for each endpoint/category. Each one asigna el método
// correcto del repositorio en su `build()`.
class NowPlayingMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetchMoreMovies = repository.getNowPlaying;
    return [];
  }
}

class PopularMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetchMoreMovies = repository.getPopular;
    return [];
  }
}

class UpcomingMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetchMoreMovies = repository.getUpcoming;
    return [];
  }
}

class TopRatedMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetchMoreMovies = repository.getTopRated;
    return [];
  }
}

class MexicanMoviesNotifier extends MoviesNotifier {
  @override
  List<Movie> build() {
    final repository = ref.watch(movieRepositoryProvider);
    fetchMoreMovies = repository.getMexicanMovies;
    return [];
  }
}