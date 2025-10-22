import 'package:go_router/go_router.dart';

import 'package:cinemapedia_220100/presentation/screens/screens.dart';

// Configuración del enrutador principal de la aplicación
// GoRouter se usa para manejar las rutas y la navegación entre pantallas
final appRouter = GoRouter(// Ruta inicial que se mostrará al abrir la aplicación
  initialLocation: '/',
  routes: [


// Definimos una ruta para la pantalla principal (HomeScreen)
  GoRoute(
    path: '/',                         
    name: HomeScreen.name,              
    builder: (context, state) => const HomeScreen(),
  ),


  ]
);
