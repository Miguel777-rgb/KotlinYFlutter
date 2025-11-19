import 'package:flutter/material.dart';
import '../models/user.dart';

class UserViewModel extends ChangeNotifier {
  final List<User> _usuarios = [];
  bool _mostrarSoloActivos = false; // <-- NUEVO: Estado para el filtro

  // <-- NUEVO: Getter para la lista filtrada
  List<User> get usuarios {
    if (_mostrarSoloActivos) {
      return _usuarios.where((user) => user.activo).toList();
    }
    return _usuarios;
  }

  // <-- NUEVO: Getter para obtener el estado del filtro
  bool get mostrarSoloActivos => _mostrarSoloActivos;

  // <-- NUEVO: Método para cambiar el estado del filtro
  void toggleMostrarSoloActivos() {
    _mostrarSoloActivos = !_mostrarSoloActivos;
    notifyListeners(); // Notifica para que la UI se reconstruya con la lista filtrada
  }

  void agregarUsuario(User usuario) {
    _usuarios.add(usuario);
    notifyListeners();
  }

  void editarUsuario(int index, User usuario) {
    // IMPORTANTE: Se busca el índice en la lista original para evitar errores con el filtro
    final originalIndex = _usuarios.indexOf(usuarios[index]);
    if (originalIndex != -1) {
      _usuarios[originalIndex] = usuario;
      notifyListeners();
    }
  }

  void eliminarUsuario(int index) {
    // IMPORTANTE: Se busca el índice en la lista original
    final originalIndex = _usuarios.indexOf(usuarios[index]);
    if (originalIndex != -1) {
      _usuarios.removeAt(originalIndex);
      notifyListeners();
    }
  }
}