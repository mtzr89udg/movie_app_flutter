class Movie {
  final int? id;
  final String title;
  final String year;
  final String director;
  final String genre;
  final String synopsis;
  final String imageUrl;

  Movie({
    this.id,
    required this.title,
    required this.year,
    required this.director,
    required this.genre,
    required this.synopsis,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'director': director,
      'genre': genre,
      'synopsis': synopsis,
      'imageUrl': imageUrl,
    };
  }

  factory Movie.fromMap(Map<String, dynamic> map) {
    return Movie(
      id: map['id'],
      title: map['title'],
      year: map['year'],
      director: map['director'],
      genre: map['genre'],
      synopsis: map['synopsis'],
      imageUrl: map['imageUrl'],
    );
  }
}
