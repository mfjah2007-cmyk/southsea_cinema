import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  // Load movies from the JSON asset file.
  Future<List<Movie>> getMovies() async {
    // Read the JSON file.
    final String response =
        await rootBundle.loadString('assets/data/movies.json');

    // Convert the JSON text into a Dart list.
    final List<dynamic> data = jsonDecode(response);

    // Convert each JSON entry into a Movie object.
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }

  // Find a movie using its ID.
  Future<Movie?> getMovieById(String id) async {
    // Load all available movies.
    final movies = await getMovies();

    // Search for a movie with a matching ID.
    for (Movie movie in movies) {
      if (movie.id == id) {
        return movie;
      }
    }

    // Return null if no movie was found.
    return null;
  }
}
