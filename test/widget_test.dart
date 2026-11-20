import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  // Initialise Flutter before running tests.
  TestWidgetsFlutterBinding.ensureInitialized();

  
  testWidgets('Home page displays movies and booking buttons',
      (WidgetTester tester) async {
    // Start the cinema application.
    await tester.pumpWidget(const SouthseaCinemaApp());

    // Wait for the JSON movies to load.
    await tester.pumpAndSettle();

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

  
  testWidgets('Basket button opens the basket page',
      (WidgetTester tester) async {
    // Start the cinema application.
    await tester.pumpWidget(const SouthseaCinemaApp());

    // Wait for the home page to load.
    await tester.pumpAndSettle();

    // Tap the basket button.
    // Tap the basket button.
    await tester.tap(find.byTooltip('Open basket'));

// Allow the basket page to appear.
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    // Check that the basket page is displayed.
    expect(find.text('My Basket'), findsOneWidget);
  });
}
