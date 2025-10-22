/// Proveedores de Riverpod para manejar el estado de las películas en cartelera (Now Playing).
/// Contiene el StateNotifier que se encarga de obtener más películas y actualizar el estado de la UI.

import 'package:cinemapedia_220100/domain/entities/movie.dart';
import 'package:cinemapedia_220100/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Proveedor que expone la lista de películas actualmente en cartelera.
/// Se conecta con el repositorio para obtener los datos mediante un [MoviesNotifier].
final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

// Función que obtiene más películas desde el repositorio
final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;

return MoviesNotifier(
fetchMoreMovies: fetchMoreMovies
);
});

/// Tipo de función que define cómo se obtienen las películas, con paginación opcional.
typedef MovieCallback = Future<List<Movie>> Function({ int page });

/// Notificador que maneja el estado de la lista de películas.
/// Permite cargar más páginas y actualizar automáticamente el estado para la UI.
class MoviesNotifier extends StateNotifier<List<Movie>> {

int currentPage = 0;               // Página actual de resultados
MovieCallback fetchMoreMovies;     // Función para obtener más películas

MoviesNotifier({
required this.fetchMoreMovies,
}): super([]);

/// Carga la siguiente página de películas y actualiza el estado.
Future<void> loadNextPage() async{
currentPage++;
final List<Movie> movies = await fetchMoreMovies( page: currentPage );
state = [...state, ...movies]; // Agrega nuevas películas al estado actual
}
}
