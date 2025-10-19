import 'package:cinemapedia_220100/domain/entities/movie.dart';
import 'package:cinemapedia_220100/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// PROVIDER DE ESTADO - Maneja la lista de películas en cartelera
// StateNotifierProvider permite que widgets escuchen cambios en la lista
final nowPlayingMoviesProvider =
    StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {
      // Obtiene la función para cargar películas desde el repositorio
      final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

      // Crea el notificador con la función de carga
      return MoviesNotifier(fetchMoreMovies: fetchMoreMovies);
    });

// Tipo personalizado para la función que obtiene películas
typedef MovieCallback = Future<List<Movie>> Function({int page});

// NOTIFICADOR DE ESTADO - Maneja la lógica de paginación y carga de películas
class MoviesNotifier extends StateNotifier<List<Movie>> {
  int currentPage = 0;           // Página actual para paginación
  MovieCallback fetchMoreMovies; // Función para obtener más películas

  // Constructor: inicia con lista vacía
  MoviesNotifier({required this.fetchMoreMovies}) : super([]);

  // Carga la siguiente página de películas
  Future<void> loadNextPage() async {
    currentPage++;  // Incrementa la página
    
    // Obtiene nuevas películas de la API
    final List<Movie> movies = await fetchMoreMovies(page: currentPage);
    
    // Agrega las nuevas películas al estado actual (concatena listas)
    state = [...state, ...movies];
  }
}
