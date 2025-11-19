import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodels/user_view_model.dart';
import 'views/user_list_screen.dart';
import 'views/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserViewModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Usuarios',
      theme: ThemeData(primarySwatch: Colors.indigo),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(), // Ruta para el Login
        '/user_list': (context) => const UserListScreen(), // Ruta para la lista de usuarios
      },
    );
  }
}