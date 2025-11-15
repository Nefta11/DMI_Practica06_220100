import 'package:flutter/material.dart';
import 'package:cinemapedia_220100/config/router/app_router.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:cinemapedia_220100/config/theme/app_theme.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Función principal donde inicia la aplicación
Future<void> main() async{
  
  await dotenv.load(fileName: '.env'); // Cargamos las variables de entorno del archivo .env antes de ejecutar la app
  runApp( // runApp inicia la aplicación con el widget principal MainApp
    const ProviderScope(child: MainApp() )
  );
}

// Clase principal de la aplicación
class MainApp extends StatelessWidget {
  const MainApp({super.key});

@override 
// También se define el tema de la app y se quita el banner de debug
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      );
    }
}
