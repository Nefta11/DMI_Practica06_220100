import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});
  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Bienvenid@ a Cinemapedia - 220100',
      'Estableciendo elementos de comunicación',
      'Conectando con la API de The Movie DB',
      'Obteniendo las peliculas que actualmente se proyectan en cines',
      'Obteniendo los proximos estrenos',
      'Obteniendo las peliculas mejor calificadas',
      'Obteniendo las mejores peliculas mexicanas',
      'Todo listo, disfruta de la aplicación',
    ];

    return Stream.periodic(const Duration(microseconds: 1500), (step) {
      return messages[step];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Bienvenid@ a Cinemapedia - 220100'),
          const SizedBox(height: 10),
          const CircularProgressIndicator(strokeWidth: 4),
          const SizedBox(height: 10),
          StreamBuilder<String>(
            stream: getLoadingMessages(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Text('Cargando...');
              }
              return Text(snapshot.data!);
            },
          ),
        ],
      ),
    );
  }
}
