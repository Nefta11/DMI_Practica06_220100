import 'package:flutter/material.dart';

// Importaciones para la configuración de la app
import 'package:cinemapedia_220100/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart'; // Para leer variables de entorno (.env)

import 'package:cinemapedia_220100/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // Para manejo de estado global

// Función principal - punto de entrada de la aplicación
Future<void> main() async {
  // Carga las variables de entorno (API keys) desde el archivo .env
  await dotenv.load(fileName: '.env');

  // Inicia la app envuelta en ProviderScope para el manejo de estado con Riverpod
  runApp(const ProviderScope(child: MainApp()));
}

// Widget principal de la aplicación
class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter, // Configuración de rutas/navegación
      debugShowCheckedModeBanner: false, // Quita el banner de debug
      theme: AppTheme().getTheme(), // Tema personalizado de la app
    );
  }
}
