
import 'package:southsea_cinema/models/movie.dart';

class MovieRepository {
  List<Movie> getMovies() {
    return [
      const Movie(
        id: '1',
        title: 'The Maze Runner',
        synopsis: 'A young man wakes up in a mysterious maze.',
        ageRating: 'PG-13',
        screeningTime: 'Thursday 15 Oct 2026, 18:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/maze_runner.jpeg',
      ),
    ];
  }
}
