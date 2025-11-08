/*
 * Descripción corta:  Define la interfaz de paginación.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-11-08
 * Fecha Última Modificación: 2025-11-08
 */
// lib/pages.dart
import 'package:flutter/material.dart';

// Widgets simples para el contenido de las pestañas
class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.home, size: 80, color: Colors.blueGrey),
          SizedBox(height: 20),
          Text(
            'Bienvenido a la Página de Inicio',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class UsersPageContent extends StatelessWidget {
  const UsersPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.group, size: 80, color: Colors.green),
          SizedBox(height: 20),
          Text(
            'Explora nuestros Usuarios',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class SettingsPageContent extends StatelessWidget {
  const SettingsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.settings, size: 80, color: Colors.orange),
          SizedBox(height: 20),
          Text(
            'Configuración de la Aplicación',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}