import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  // Test that the cinema home page displays correctly.
  testWidgets('Home page displays movies and booking buttons',
      (WidgetTester tester) async {
    // Start the cinema application.
    await tester.pumpWidget(const SouthseaCinemaApp());

    // Check that the application title is displayed.
    expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);

    // Check that both movie titles are displayed.
    expect(find.text('The Maze Runner'), findsOneWidget);
    expect(find.text('The Hunger Games'), findsOneWidget);

    // Check that both movies have a BOOK NOW button.
    expect(find.text('BOOK NOW'), findsNWidgets(2));

    // Check that the basket button is displayed.
    expect(find.byTooltip('Open basket'), findsOneWidget);
  });

  // Test that the basket button opens the basket page.
  testWidgets('Basket button opens the basket page',
      (WidgetTester tester) async {
    // Start the cinema application.
    await tester.pumpWidget(const SouthseaCinemaApp());

    // Tap the basket button.
    await tester.tap(find.byTooltip('Open basket'));
    await tester.pumpAndSettle();

    // Check that the basket page is displayed.
    expect(find.text('My Basket'), findsOneWidget);
  });
}
