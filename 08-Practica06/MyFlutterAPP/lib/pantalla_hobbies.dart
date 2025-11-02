/*
 * Descripción corta:  Define la interfaz de usuario para la pantalla de hobbies e intereses.
 *                     Muestra una lista de actividades con íconos y descripciones.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-11-02
 * Fecha Última Modificación: 2025-11-02
 */

import 'package:flutter/material.dart';

class PantallaHobbies extends StatelessWidget {
  const PantallaHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Hobbies e Intereses'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(height: 10),
            _crearHobby(
              icono: Icons.videogame_asset,
              titulo: 'Jugar Videojuegos',
              descripcion: 'Me encantan los juegos de estrategia y RPG.',
              color: Colors.red,
            ),
            const SizedBox(height: 15),
            _crearHobby(
              icono: Icons.music_note,
              titulo: 'Escuchar Música',
              descripcion: 'Disfruto de géneros como el rock y el jazz.',
              color: Colors.purple,
            ),
            const SizedBox(height: 15),
            _crearHobby(
              icono: Icons.code,
              titulo: 'Programar',
              descripcion: 'Crear aplicaciones y resolver problemas lógicos.',
              color: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }

  // Widget reutilizable para cada hobby
  Widget _crearHobby({
    required IconData icono,
    required String titulo,
    required String descripcion,
    required Color color,
  }) {
    return Card(
      elevation: 4.0,
      child: ListTile(
        leading: Icon(icono, color: color, size: 40),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(descripcion),
        contentPadding: const EdgeInsets.all(10),
      ),
    );
  }
}