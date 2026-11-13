
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  // Test that the cinema home page displays correctly.
  testWidgets('Home page displays movies and booking buttons',
      (WidgetTester tester) async {

    // Start the cinema application.
    await tester.pumpWidget(const SouthseaCinemaApp());

    // Check that the application title is displayed.
    expect(find.text('Southsea Cinema & Arts'), findsOneWidget);

    // Check that both movie titles are displayed.
    expect(find.text('The Maze Runner'), findsOneWidget);
    expect(find.text('The Hunger Games'), findsOneWidget);

    // Check that both movies have a BOOK NOW button.
    expect(find.text('BOOK NOW'), findsNWidgets(2));
  });
}

