import 'package:cinemapedia_220100/presentation/providers/movies/movies_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// PANTALLA PRINCIPAL - Widget que muestra la lista de películas
class HomeScreen extends StatelessWidget {
  static const name = 'home-screen'; // Nombre para navegación

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold proporciona la estructura básica de la pantalla
    return const Scaffold(body: _HomeView());
  }
}

// VISTA PRIVADA - ConsumerStatefulWidget para escuchar cambios del provider
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    // Carga la primera página de películas cuando se inicializa la pantalla
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    // Escucha cambios en la lista de películas
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    // Construye una lista desplazable con las películas
    return ListView.builder(
      itemCount: nowPlayingMovies.length,
      itemBuilder: (context, index) {
        final movie = nowPlayingMovies[index];
        // Por ahora solo muestra el título en un ListTile simple
        return ListTile(title: Text(movie.title));
      },
    );
  }
}
