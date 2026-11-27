import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/services/basket_service.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/views/basket_view.dart';

void main() {
  // Create a movie to use in the tests.
  const testMovie = Movie(
    id: '1',
    title: 'The Maze Runner',
    synopsis: 'A group of teenagers try to escape a maze.',
    ageRating: 'PG-13',
    screeningTime: '18:00',
    ticketPrice: 7.50,
    imagePath: 'assets/images/maze_runner.jpeg',
  );

  // Clear the basket before and after each test.
  setUp(() {
    BasketService.instance.clearBasket();
  });

  tearDown(() {
    BasketService.instance.clearBasket();
  });

  Future<void> openMovieListing(WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: const MovieListing(movie: testMovie),
        routes: {
          '/basket': (context) => const BasketView(),
        },
      ),
    );
    await tester.pumpAndSettle();
  }

  Future<void> selectTickets(
    WidgetTester tester,
    String quantity,
  ) async {
    await tester.ensureVisible(find.byType(DropdownMenu<int>));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(DropdownMenu<int>));
    await tester.pumpAndSettle();

    await tester.tap(find.text(quantity).last);
    await tester.pumpAndSettle();
  }

  testWidgets('Selecting tickets updates the total price',
      (WidgetTester tester) async {
    await openMovieListing(tester);

    await selectTickets(tester, '2');

    expect(find.text('Total: £15.00'), findsOneWidget);
  });

  testWidgets('Adding tickets displays a confirmation',
      (WidgetTester tester) async {
    await openMovieListing(tester);

    await selectTickets(tester, '2');

    await tester.ensureVisible(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();

    expect(
      find.text('Added 2 tickets to your basket.'),
      findsOneWidget,
    );

    expect(BasketService.instance.totalQuantity, 2);
  });

  testWidgets('Adding zero tickets displays a warning',
      (WidgetTester tester) async {
    await openMovieListing(tester);

    await tester.ensureVisible(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();

    expect(
      find.text('Please select at least one ticket.'),
      findsOneWidget,
    );

    expect(BasketService.instance.totalQuantity, 0);
  });

  testWidgets('Adding more than five tickets is prevented',
      (WidgetTester tester) async {
    BasketService.instance.addMovie(testMovie, 4);

    await openMovieListing(tester);

    await selectTickets(tester, '2');

    await tester.ensureVisible(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();

    await tester.tap(find.text('ADD TO ORDER'));
    await tester.pumpAndSettle();

    expect(
      find.text('You can only order 5 tickets in total.'),
      findsOneWidget,
    );

    expect(BasketService.instance.totalQuantity, 4);
  });

  testWidgets('Basket button opens the basket screen',
      (WidgetTester tester) async {
    await openMovieListing(tester);

    await tester.tap(find.byTooltip('Open basket'));
    await tester.pumpAndSettle();

    expect(find.text('My Basket'), findsOneWidget);
  });
}
