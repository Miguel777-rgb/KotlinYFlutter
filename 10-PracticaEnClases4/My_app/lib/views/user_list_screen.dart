import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';
import '../models/user.dart';
import 'user_form_screen.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Usuarios')),
      body: ListView.builder(
        itemCount: viewModel.usuarios.length,
        itemBuilder: (context, index) {
          final user = viewModel.usuarios[index];
          return Card(
            child: ListTile(
              title: Text(user.nombre),
              subtitle: Text('${user.genero} - ${user.activo ? 'Activo' : 'Inactivo'}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () async {
                      final actualizado = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => UserFormScreen(
                            usuario: user,
                            indice: index,
                          ),
                        ),
                      );
                      if (actualizado != null && actualizado is User) {
                        viewModel.editarUsuario(index, actualizado);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => viewModel.eliminarUsuario(index),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final nuevoUsuario = await Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => const UserFormScreen()),
          );
          if (nuevoUsuario != null && nuevoUsuario is User) {
            viewModel.agregarUsuario(nuevoUsuario);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
