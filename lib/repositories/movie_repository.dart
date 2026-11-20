import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  
  Future<List<Movie>> getMovies() async {
   
    final String response =
        await rootBundle.loadString('assets/data/movies.json');

    
    final List<dynamic> data = jsonDecode(response);

    
    return data.map((movie) => Movie.fromJson(movie)).toList();
  }

  
  Future<Movie?> getMovieById(String id) async {
    
    final movies = await getMovies();

    
    for (Movie movie in movies) {
      if (movie.id == id) {
        return movie;
      }
    }

   
    return null;
  }
}
