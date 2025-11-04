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
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(topRatedMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(mexicanMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popular = ref.watch(popularMoviesProvider);
    final topRated = ref.watch(topRatedMoviesProvider);
    final upcommingMovies = ref.watch(upcomingMoviesProvider);
    final mexicanMovies = ref.watch(mexicanMoviesProvider);

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
            movies: upcommingMovies,
            title: 'Próximamente',
            subtitle: 'Noviembre',
            loadNextPage: () =>
                ref.read(upcomingMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: popular,
            title: 'Populares',
            subtitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(popularMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: topRated,
            title: 'Mejor Calificadas',
            subtitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(topRatedMoviesProvider.notifier).loadNextPage(),
          ),

          MovieHorizontalListview(
            movies: mexicanMovies,
            title: 'Picardia Mexicana',
            subtitle: 'Miércoles, 22 de Octubre',
            loadNextPage: () =>
                ref.read(mexicanMoviesProvider.notifier).loadNextPage(),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}
