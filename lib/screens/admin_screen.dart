import 'package:flutter/material.dart';
import '../database/database_helper.dart';
import '../models/movie.dart';

class AdminScreen extends StatelessWidget {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController yearController = TextEditingController();
  final TextEditingController directorController = TextEditingController();
  final TextEditingController genreController = TextEditingController();
  final TextEditingController synopsisController = TextEditingController();
  final TextEditingController imageUrlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Administración')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Título'),
            ),
            TextField(
              controller: yearController,
              decoration: InputDecoration(labelText: 'Año'),
            ),
            TextField(
              controller: directorController,
              decoration: InputDecoration(labelText: 'Director'),
            ),
            TextField(
              controller: genreController,
              decoration: InputDecoration(labelText: 'Género'),
            ),
            TextField(
              controller: synopsisController,
              decoration: InputDecoration(labelText: 'Sinopsis'),
            ),
            TextField(
              controller: imageUrlController,
              decoration: InputDecoration(labelText: 'Imagen URL'),
            ),
            ElevatedButton(
              onPressed: () async {
                Movie movie = Movie(
                  title: titleController.text,
                  year: yearController.text,
                  director: directorController.text,
                  genre: genreController.text,
                  synopsis: synopsisController.text,
                  imageUrl: imageUrlController.text,
                );
                await DatabaseHelper().insertMovie(movie);
                // Limpiar campos después de agregar
                titleController.clear();
                yearController.clear();
                directorController.clear();
                genreController.clear();
                synopsisController.clear();
                imageUrlController.clear();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Película agregada con éxito')),
                );
              },
              child: Text('Agregar Película'),
            ),
            SizedBox(height: 20),
            Text('Eliminar Película'),
            // Aquí puedes agregar un Dropdown o ListView para seleccionar y eliminar películas
            FutureBuilder<List<Movie>>(
              future: DatabaseHelper().getMovies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Text('No hay películas para eliminar.');
                }
                return DropdownButton<Movie>(
                  hint: Text('Selecciona una película'),
                  onChanged: (Movie? selectedMovie) async {
                    if (selectedMovie != null) {
                      await DatabaseHelper().deleteMovie(selectedMovie.id!);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Película eliminada con éxito')),
                      );
                    }
                  },
                  items: snapshot.data!.map((Movie movie) {
                    return DropdownMenuItem<Movie>(
                      value: movie,
                      child: Text(movie.title),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
