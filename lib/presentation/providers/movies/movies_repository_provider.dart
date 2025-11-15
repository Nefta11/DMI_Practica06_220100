/// Proveedor de Riverpod que expone el repositorio de películas a la capa de presentación.
/// Permite acceder a los métodos del repositorio de forma inmutable desde cualquier widget o provider.

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemapedia_220100/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia_220100/infrastructure/repositories/movie_repository_impl.dart';

// Proveedor que crea una instancia de MovieRepositoryImpl con MoviedbDatasource
// Se utiliza para inyectar la dependencia del repositorio en otros providers o widgets
final movieRepositoryProvider = Provider((ref) {
return MovieRepositoryImpl( MoviedbDatasource() );
});
