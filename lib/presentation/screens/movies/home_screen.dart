import 'package:cinemapedia_220100/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia_220100/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  // Nombre estático de la ruta para la navegación
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomButtonNavigationbar(),
    );
  }
}

/// Vista interna de la HomeScreen que puede reaccionar a cambios de estado (ConsumerStatefulWidget)
class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref
        .read(nowPlayingMoviesProvider.notifier)
        .loadNextPage(); // Carga la primera página de películas al iniciar la pantalla
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const CustomAppbar(),

          // Solo muestra las primeras 6 películas en el slideshow
          MovieSlideshow(movies: nowPlayingMovies.take(6).toList()),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'En cines',
            subtitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Próximamente',
            subtitle: 'Noviembre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Populares',
            subtitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Mejor Calificadas',
            subtitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: nowPlayingMovies,
            title: 'Picardia Mexicana',
            subtitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(nowPlayingMoviesProvider.notifier).loadNextPage(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
