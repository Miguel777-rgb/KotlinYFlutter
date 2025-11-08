/*
 * Descripción corta:  Punto de entrada de la aplicación Flutter.
 *                     Configura el App y define la pantalla inicial a mostrar.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-11-08
 * Fecha Última Modificación: 2025-11-08
 */
// lib/main.dart
import 'package:flutter/material.dart';
import 'package:bottom_nav_example/home_page.dart'; // Importamos HomePage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ejemplo BottomNavigationBar Profesional',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(), // Usamos MyHomePage como la pantalla principal
    );
  }
}}