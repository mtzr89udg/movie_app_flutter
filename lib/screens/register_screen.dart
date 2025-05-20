import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/user.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrarse')),
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
                User user = User(
                  username: usernameController.text,
                  password: passwordController.text,
                );
                await DatabaseHelper().insertUser(user);
                Navigator.pop(context);
              },
              child: Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
