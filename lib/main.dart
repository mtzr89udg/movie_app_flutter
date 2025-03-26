import 'package:flutter/material.dart';
import 'package:firstapp/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "3.3 Inicio del desarrollo",
      home: HolaMundoHome()
    );
  }
}