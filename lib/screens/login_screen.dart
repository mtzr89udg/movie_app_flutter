import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/user.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Iniciar Sesión')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Usuario'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Contraseña'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () async {
                // Verificar si el usuario es admin
                if (usernameController.text == 'admin' && passwordController.text == 'admin') {
                  Navigator.pushNamed(context, '/admin'); // Redirigir a la pantalla de administración
                } else {
                  // Verificar usuario en la base de datos
                  User? user = await DatabaseHelper().getUser(
                    usernameController.text,
                    passwordController.text,
                  );
                  if (user != null) {
                    Navigator.pushNamed(context, '/catalog'); // Redirigir a la pantalla de catálogo
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Usuario o contraseña incorrectos')),
                    );
                  }
                }
              },
              child: Text('Iniciar Sesión'),
            ),
          ],
        ),
      ),
    );
  }
}
