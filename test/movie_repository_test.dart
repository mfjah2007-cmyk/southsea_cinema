import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';

void main() {
  // Initialise Flutter before loading assets.
  TestWidgetsFlutterBinding.ensureInitialized();

  // Create a group of tests for the Movie Repository.
  group('Movie Repository tests', () {
    final repository = MovieRepository();

    // Check that all movies are returned.
    test('getMovies returns all available movies', () async {
      final movies = await repository.getMovies();

      expect(movies.length, 2);
      expect(movies[0].title, 'The Maze Runner');
      expect(movies[1].title, 'The Hunger Games');
    });

    // Check that an existing movie can be found.
    test('getMovieById finds an existing movie', () async {
      final movie = await repository.getMovieById('1');

      expect(movie, isNotNull);
      expect(movie!.title, 'The Maze Runner');
    });

    // Check that a missing movie ID returns null.
    test('getMovieById returns null for a missing ID', () async {
      final movie = await repository.getMovieById('999');

      expect(movie, isNull);
    });
  });
}
