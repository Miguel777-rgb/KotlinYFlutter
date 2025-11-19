import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/user_view_model.dart';
import '../models/user.dart';
import 'user_form_screen.dart';
// ✅ Actividad 3.1.: Mostrar email en la pantalla CRUD
class UserListScreen extends StatelessWidget {
  // ✅ 1. Variable para recibir el email
  final String email;

  // ✅ 2. Constructor actualizado para requerir el email
  const UserListScreen({super.key, required this.email});

  @override
  Widget build(BuildContext context) {
    // Usamos context.watch para que la UI se reconstruya al cambiar el estado del ViewModel
    final viewModel = context.watch<UserViewModel>();

    return Scaffold(
      appBar: AppBar(
        // ✅ 3. Usamos el email recibido en el título
        title: Text('Bienvenido: $email'),

        // <-- Switch para el filtro en la AppBar (Mantenemos tu lógica existente)
        actions: [
          Row(
            children: [
              const Text("Solo Activos"),
              Switch(
                value: viewModel.mostrarSoloActivos,
                onChanged: (_) {
                  // Usamos context.read para llamar a un método que no necesita reconstruir el widget en ese instante
                  context.read<UserViewModel>().toggleMostrarSoloActivos();
                },
              ),
            ],
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: viewModel.usuarios.length,
        itemBuilder: (context, index) {
          final user = viewModel.usuarios[index];
          return Card(
            child: ListTile(
              title: Text('${user.nombre} (${user.edad} años)'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user.correo),
                  Text('${user.genero} - ${user.activo ? 'Activo' : 'Inactivo'}'),
                ],
              ),
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
                        context.read<UserViewModel>().editarUsuario(index, actualizado);
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => context.read<UserViewModel>().eliminarUsuario(index),
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
            context.read<UserViewModel>().agregarUsuario(nuevoUsuario);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
