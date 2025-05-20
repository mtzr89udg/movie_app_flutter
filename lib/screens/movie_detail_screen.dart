import 'package:flutter/material.dart';
import '../models/movie.dart';

class MovieDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      appBar: AppBar(title: Text(movie.title)),
      body: Column(
        children: [
          Image.network(movie.imageUrl),
          Text('Año: ${movie.year}'),
          Text('Director: ${movie.director}'),
          Text('Género: ${movie.genre}'),
          Text('Sinopsis: ${movie.synopsis}'),
        ],
      ),
    );
  }
}
