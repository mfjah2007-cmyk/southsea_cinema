
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

  // Test 1: The basket screen displays correctly.
  testWidgets('Basket screen displays correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: BasketView(),
      ),
    );

    expect(find.text('My Basket'), findsOneWidget);
  });

  // Test 2: Added movies appear in the basket.
  testWidgets('Added movie appears in the basket',
      (WidgetTester tester) async {
    BasketService.instance.addMovie(testMovie, 2);

    await tester.pumpWidget(
      const MaterialApp(
        home: BasketView(),
      ),
    );

    expect(find.text('The Maze Runner'), findsOneWidget);
  });

  // Test 3: The correct ticket quantity is displayed.
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

  // Test 4: Removing a movie empties the basket.
  testWidgets('Removing a movie empties the basket',
      (WidgetTester tester) async {
    BasketService.instance.addMovie(testMovie, 2);

    await tester.pumpWidget(
      const MaterialApp(
        home: BasketView(),
      ),
    );

    await tester.ensureVisible(find.byIcon(Icons.delete));
    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    expect(BasketService.instance.items, isEmpty);
  });
}
