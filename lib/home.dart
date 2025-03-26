import 'package:flutter/material.dart';

class HolaMundoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          tooltip: "Menu principal",
          onPressed: () => {
            print("Haciendo clic..")
          },
        ),
        title: Text('3.3. Inicio del desarrollo'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            tooltip: "Buscar",
            onPressed: () => {
              print('buscando..')
            }
          )
        ],
      ),
      body: Center(
        child: Text('¡Hola mundo!'),
      )
    );
  }
}