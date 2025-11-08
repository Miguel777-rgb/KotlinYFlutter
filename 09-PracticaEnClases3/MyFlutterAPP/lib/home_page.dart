/*
 * Descripción corta:  Define la interfaz de home.
 * Autor: Miguel Flores
 * Fecha Creación: 2025-11-08
 * Fecha Última Modificación: 2025-11-08
 */

// lib/home_page.dart
import 'package:flutter/material.dart';
import 'package:bottom_nav_example/profile_tab.dart'; // Importamos ProfileTab
import 'package:bottom_nav_example/edit_profile_screen.dart'; // Importamos EditarPerfilScreen
import 'package:bottom_nav_example/pages.dart'; // Importamos las páginas estáticas

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  String _nombreUsuario = 'Usuario Predeterminado';

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      const HomePageContent(),       // Contenido del Tab de Inicio
      const UsersPageContent(),      // Contenido del Tab de Usuarios
      const SettingsPageContent(),   // Contenido del Tab de Configuración
      ProfileTab(
        nombreUsuario: _nombreUsuario,
        onEditPressed: _navigateToEditProfile,
      ),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _navigateToEditProfile() async {
    final nombre = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditarPerfilScreen()),
    );
    if (nombre != null && nombre is String) {
      setState(() {
        _nombreUsuario = nombre;
        // Actualizar la instancia de ProfileTab con el nuevo nombre
        _pages[3] = ProfileTab(
          nombreUsuario: _nombreUsuario,
          onEditPressed: _navigateToEditProfile,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ejemplo BottomNavigationBar')),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Usuarios'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Config'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }
}