import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';

void main() {
  group('Movie model tests', () {
    test('Movie constructor assigns properties correctly', () {
      const movie = Movie(
        id: '1',
        title: 'The Maze Runner',
        synopsis: 'A young man wakes up in a mysterious maze.',
        ageRating: 'PG-13',
        screeningTime: 'Thursday 15 Oct 2026, 18:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/maze_runner.jpeg',
      );

      expect(movie.id, '1');
      expect(movie.title, 'The Maze Runner');
      expect(movie.synopsis, 'A young man wakes up in a mysterious maze.');
      expect(movie.ageRating, 'PG-13');
      expect(movie.ticketPrice, 7.50);
      expect(movie.imagePath, 'assets/images/maze_runner.jpeg');
    });

    test('formattedPrice displays two decimal places', () {
      const movie = Movie(
        id: '1',
        title: 'The Maze Runner',
        synopsis: 'A young man wakes up in a mysterious maze.',
        ageRating: 'PG-13',
        screeningTime: 'Thursday 15 Oct 2026, 18:00',
        ticketPrice: 7.50,
        imagePath: 'assets/images/maze_runner.jpeg',
      );

      expect(movie.formattedPrice, '£7.50');
    });

    test('formattedPrice displays two decimal places for whole pounds', () {
      const movie = Movie(
        id: '2',
        title: 'The Hunger Games',
        synopsis: 'A young woman takes part in a competition.',
        ageRating: '12A',
        screeningTime: 'Friday 16 Oct 2026, 18:00',
        ticketPrice: 10.0,
        imagePath: 'assets/images/hunger_games.jpeg',
      );

      expect(movie.formattedPrice, '£10.00');
    });
  });
}
