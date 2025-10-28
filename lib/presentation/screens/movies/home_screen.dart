import 'package:cinemapedia_220100/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia_220100/presentation/providers/movies/movie_slideshow_provider.dart';
import 'package:cinemapedia_220100/presentation/providers/providers.dart';
import 'package:cinemapedia_220100/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220100/presentation/widgets/shared/custom_button_navigationbar.dart';


class HomeScreen extends StatelessWidget {// Nombre estático de la ruta para la navegación
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
  ref.read( nowPlayingMoviesProvider.notifier ).loadNextPage(); // Carga la primera página de películas al iniciar la pantalla
}

@override
Widget build(BuildContext context) {
  //final nowPlayingMovies = ref.watch( nowPlayingMoviesProvider ); // Obtiene la lista actualizada de películas desde el provider
  final slideShowMovies = ref.watch(moviesSlidesShowProvide);
  return Column(
    children: [

      CustomAppbar(),

      MovieSlideshow(movies: slideShowMovies)
      ]
    );
  }
}
