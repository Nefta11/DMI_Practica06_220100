import 'package:flutter_dotenv/flutter_dotenv.dart';

// Clase para centralizar el acceso a variables de entorno
// Esto mantiene las API keys y configuraciones sensibles separadas del código
class Environment {
  // Obtiene la API key de TMDB desde el archivo .env
  // Si no existe, muestra un mensaje de error en lugar de romper la app
  static String theMovieDbKey =
      dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
}
