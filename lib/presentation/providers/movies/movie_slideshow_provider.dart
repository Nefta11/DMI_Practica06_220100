import 'package:cinemapedia_matricula/domain/entities/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'movies_providers.dart';

final moviesSlidesShowProvide = Provider<List<Movie>>((ref) {
  {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    if (nowPlayingMovies.isEmpty) return [];
    return nowPlayingMovies.sublist(0, 6);
  }
});
