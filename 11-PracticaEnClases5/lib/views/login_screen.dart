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
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  // Validar
                  if (_formKey.currentState!.validate()) {
                    // Ejecutar onSaved de cada campo
                    _formKey.currentState!.save();

                    if (_email == 'admin@test.com' && _password == '123456') {
                      Navigator.pushReplacementNamed(context, '/user_list');
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
