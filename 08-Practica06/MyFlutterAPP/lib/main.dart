/*
 * Descripción corta:  Punto de entrada de la aplicación Flutter.
 *                     Configura el widget MaterialApp y define la pantalla inicial a mostrar.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-11-02
 * Fecha Última Modificación: 2025-11-02
 */
import 'package:flutter/material.dart';
import 'pantalla_inicio.dart';
import 'pantalla_perfil.dart';
import 'pantalla_hobbies.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mi App Personal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // Cambia la pantalla aquí para probar cada una
      home: PantallaInicio(),
      //home: PantallaPerfil(),
      //home: PantallaHobbies(),
    );
  }
}