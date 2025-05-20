import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/login_screen.dart';
import 'screens/register_screen.dart';
import 'screens/catalog_screen.dart';
import 'screens/movie_detail_screen.dart';
import 'screens/admin_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Catálogo de Películas',
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/catalog': (context) => CatalogScreen(),
        '/movieDetail': (context) => MovieDetailScreen(),
        '/admin': (context) => AdminScreen(),
      },
    );
  }
}
