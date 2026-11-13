
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  // This method returns all the movies available in the cinema.
  List<Movie> getMovies() {
    return [
      // First movie
      const Movie(
        id: '1',
        title: 'The Maze Runner',
        synopsis: 'A young man wakes up in a mysterious maze.',
        ageRating: 'PG-13',
        screeningTime: 'Thursday 15 Oct 2026, 18:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/maze_runner.jpeg',
      ),

      // Second movie
      const Movie(
        id: '2',
        title: 'The Hunger Games',
        synopsis:
            'A young woman takes part in a dangerous televised competition.',
        ageRating: '12A',
        screeningTime: 'Friday 16 Oct 2026, 18:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/hunger_games.jpeg',
      ),
    ];
  }
// Find a movie using its ID.
Movie? getMovieById(String id) {
  // Get all available movies.
  final movies = getMovies();

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


