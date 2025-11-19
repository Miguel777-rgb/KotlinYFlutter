import 'package:flutter/material.dart';
import 'user_list_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [

              // EMAIL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo',
                  prefixIcon: Icon(Icons.email),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'El correo es obligatorio';
                  }
                  if (!value.contains('@')) {
                    return 'Debe ser un correo válido';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),

              const SizedBox(height: 16),

              // PASSWORD
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  prefixIcon: Icon(Icons.lock),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'La contraseña es obligatoria';
                  }
                  if (value.length < 6) {
                    return 'Debe tener al menos 6 caracteres';
                  }
                  // ✅ Actividad 1: TUS NUEVAS VALIDACIONES
                  // Contiene al menos 1 mayúscula
                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return 'Debe tener al menos una mayúscula';
                  }

                  // Contiene al menos 1 número
                  if (!value.contains(RegExp(r'[0-9]'))) {
                    return 'Debe tener al menos un número';
                  }

                  return null; // Retorna null si la validación es exitosa
                },
                onSaved: (value) => _password = value!,
              ),

              // ✅ Actividad 2: Texto "¿Olvidaste tu contraseña?"
              // Lo alineamos a la derecha, justo debajo del input de contraseña
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Lógica para recuperar contraseña
                    print("Navegar a recuperar contraseña");
                  },
                  child: const Text(
                    "¿Olvidaste tu contraseña?",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  // Validar
                  if (_formKey.currentState!.validate()) {
                    // Ejecutar onSaved de cada campo
                    _formKey.currentState!.save();
                    // ✅ Actividad 3.2.: Mostrar email en la pantalla CRUD
                    if (_email == 'admin@test.com' && _password == 'MiPasword123') {
                      // ✅ Cambia la navegación para pasar el email
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserListScreen(email: _email),
                        ),
                      );
                    } else {
                      // Si las credenciales son incorrectas, muestra un mensaje de error.
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Correo o contraseña incorrectos.'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  }
                },
                child: const Text('Ingresar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
