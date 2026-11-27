import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  // Initialise Flutter before running tests.
  TestWidgetsFlutterBinding.ensureInitialized();

  // Test that the cinema home page displays correctly.
  testWidgets('Home page displays movies and booking buttons',
      (WidgetTester tester) async {
    // Start the cinema application.
    await tester.pumpWidget(const SouthseaCinemaApp());

    // Wait for the movies to load.
    await tester.pumpAndSettle();

    // Check that the application title is displayed.
    expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);

    expect(find.text('The Maze Runner'), findsOneWidget);
    expect(find.text('The Hunger Games'), findsOneWidget);

    expect(find.text('BOOK NOW'), findsNWidgets(2));

    expect(find.byTooltip('Open basket'), findsOneWidget);
  });

  testWidgets('Basket button opens the basket page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    await tester.pumpAndSettle();

    await tester.tap(find.byTooltip('Open basket'));

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('My Basket'), findsOneWidget);
  });
}
