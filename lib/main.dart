import 'package:flutter/material.dart';
import 'package:firstapp/home.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agendar Cita Médica',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Agendar Cita Médica'),
        ),
        body: AppointmentForm(),
      ),
    );
  }
}