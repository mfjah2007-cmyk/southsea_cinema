import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/services/basket_service.dart';
import 'package:southsea_cinema/views/basket_view.dart';

void main() {
  const testMovie = Movie(
    id: '1',
    title: 'The Maze Runner',
    synopsis: 'A group of teenagers try to escape a maze.',
    ageRating: 'PG-13',
    screeningTime: '18:00',
    ticketPrice: 7.50,
    imagePath: 'assets/images/maze_runner.jpeg',
  );

  setUp(() {
    BasketService.instance.clearBasket();
  });

  tearDown(() {
    BasketService.instance.clearBasket();
  });

  
  testWidgets('Basket screen displays correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BasketView(),
      ),
    );

    expect(find.text('My Basket'), findsOneWidget);
  });

  
  testWidgets('Added movie appears in the basket', (WidgetTester tester) async {
    BasketService.instance.addMovie(testMovie, 2);

    await tester.pumpWidget(
      const MaterialApp(
        home: BasketView(),
      ),
    );

    expect(find.text('The Maze Runner'), findsOneWidget);
  });

  
  testWidgets('Basket displays the correct ticket quantity',
      (WidgetTester tester) async {
    BasketService.instance.addMovie(testMovie, 2);

    await tester.pumpWidget(
      const MaterialApp(
        home: BasketView(),
      ),
    );

    expect(find.textContaining('2'), findsWidgets);
    expect(BasketService.instance.totalQuantity, 2);
  });
  testWidgets('Removing a movie empties the basket',
      (WidgetTester tester) async {
    BasketService.instance.addMovie(testMovie, 2);

    await tester.pumpWidget(
      const MaterialApp(
        home: BasketView(),
      ),
    );

    // Tap the REMOVE button.
    await tester.tap(find.text('REMOVE'));
    await tester.pumpAndSettle();
    await tester.pumpAndSettle();

    expect(BasketService.instance.items, isEmpty);
  });
}
