import 'dart:async';

import 'package:cinemapedia_220100/config/helpers/human_formats.dart';
import 'package:cinemapedia_220100/domain/entities/movie.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

typedef SearchMoviesCallback = Future<List<Movie>> Function(String query);

class SearchMovieDelegate extends SearchDelegate<Movie?> {
  final SearchMoviesCallback searchMovies;

  List<Movie> initialMovies;

  StreamController<List<Movie>> debouncedMovies = StreamController.broadcast();

  StreamController<bool> isLoadingStream = StreamController.broadcast();

  Timer? _debounceTimer;

  SearchMovieDelegate({required this.searchMovies, required this.initialMovies})
    : super(searchFieldLabel: 'Buscar películas');

  void clearSreams() {
    debouncedMovies.close();
  }

  void _onQueryChanged(String query) {
    isLoadingStream.add(true);

    if (_debounceTimer?.isActive ?? false) _debounceTimer!.cancel();

    _debounceTimer = Timer(const Duration(milliseconds: 500), () async {
      final movies = await searchMovies(query);
      isLoadingStream.add(false);
      debouncedMovies.add(movies);
    });

    Widget buildResultsAndSuggestions() {
      return StreamBuilder(
        initialData: initialMovies,
        stream: debouncedMovies.stream,
        builder: (context, snapshot) {
          final movies = snapshot.data ?? [];

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) => _MovieItem(
              movie: movies[index],
              onMovieSelected: (context, movie) {
                clearSreams();
                close(context, movie);
              },
            ),
          );
        },
      );
    }
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      StreamBuilder(
        initialData: false,
        stream: isLoadingStream.stream,
        builder: (context, snapshot){
          if(snapshot.data ?? false){
            return SpinPerfect(
              duration: const Duration(seconds: 20),
              spins: 10,
              infinite: true,
              child: IconButton(
                onPressed: () => query = '',
                icon: const Icon(Icons.refresh_rounded),
              )
            );
          }
          return FadeIn(
            animate: query.isNotEmpty,
            child: IconButton(
              onPressed: () =>,
            )
          )
        },
      );
    ]

  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    throw UnimplementedError();
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    throw UnimplementedError();
  }
}

class _MovieItem extends StatelessWidget {
  final Movie movie;
  final Function onMovieSelected;

  const _MovieItem({required this.movie, required this.onMovieSelected});

  @override
  Widget build(BuildContext context) {
    final TextStyles = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        onMovieSelected(context, movie);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Row(
          children: [
            SizedBox(
              width: size.width * 0.2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  movie.posterPath,
                  loadingBuilder: (context, child, loadingProgress) =>
                      FadeIn(child: child),
                ),
              ),
            ),
            const SizedBox(width: 10),
            //Descripción de cada pelicula encontrada
            SizedBox(
              width: size.width * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(movie.title, style: TextStyles.titleMedium),
                  (movie.overview.length > 100)
                      ? Text('${movie.overview.substring(0, 100)}...')
                      : Text(movie.overview),
                  Row(
                    children: [
                      Icon(
                        Icons.star_half_rounded,
                        color: Colors.yellow.shade900,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        HumanFormats.number(movie.voteAverage, 1),
                        style: TextStyles.bodyMedium!.copyWith(
                          color: Colors.yellow.shade900,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}