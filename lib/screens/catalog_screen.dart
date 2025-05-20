import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/movie.dart';

class CatalogScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catálogo de Películas')),
      body: FutureBuilder<List<Movie>>(
        future: DatabaseHelper().getMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No hay películas disponibles.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final movie = snapshot.data![index];
              return ListTile(
                title: Text(movie.title),
                leading: Image.network(movie.imageUrl),
                onTap: () {
                  Navigator.pushNamed(context, '/movieDetail', arguments: movie);
                },
              );
            },
          );
        },
      ),
    );
  }
}
