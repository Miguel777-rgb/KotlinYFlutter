/*
 * Descripción corta:  Define la interfaz de usuario como pantalla exclusiva.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-11-08
 * Fecha Última Modificación: 2025-11-08
 */
// lib/profile_tab.dart
import 'package:flutter/material.dart';

class ProfileTab extends StatelessWidget {
  final String nombreUsuario;
  final VoidCallback onEditPressed; // Callback para el botón de editar

  const ProfileTab({
    super.key,
    required this.nombreUsuario,
    required this.onEditPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Perfil', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
          const SizedBox(height: 30),
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
          const SizedBox(height: 20),
          Text(
            'Nombre de Usuario: $nombreUsuario',
            style: const TextStyle(fontSize: 22),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: onEditPressed,
            icon: const Icon(Icons.edit),
            label: const Text('Editar perfil', style: TextStyle(fontSize: 18)),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}