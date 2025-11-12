// 1. AÑADIR ESTA IMPORTACIÓN
import 'package:flutter/material.dart';
import '../models/user.dart';

// 2. AÑADIR "extends ChangeNotifier"
class UserViewModel extends ChangeNotifier {
  final List<User> _usuarios = [];

  List<User> get usuarios => _usuarios;

  void agregarUsuario(User usuario) {
    _usuarios.add(usuario);
    notifyListeners(); // <- Ahora esto funcionará correctamente
  }

  void editarUsuario(int index, User usuario) {
    _usuarios[index] = usuario;
    notifyListeners(); // <- Ahora esto funcionará correctamente
  }

  void eliminarUsuario(int index) {
    _usuarios.removeAt(index);
    notifyListeners(); // <- Ahora esto funcionará correctamente
  }
}