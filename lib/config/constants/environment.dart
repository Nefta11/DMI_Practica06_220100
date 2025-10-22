import 'package:flutter_dotenv/flutter_dotenv.dart';

// Clase que se encarga de manejar las variables de entorno del proyecto
class Environment {

// Variable estática donde se guarda la API key de The Movie DB
// Si no encuentra la clave en el archivo .env, muestra el texto 'No hay api key'
static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';

}
