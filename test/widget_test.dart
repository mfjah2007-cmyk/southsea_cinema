import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/main.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Home page displays movies and booking buttons',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    await tester.pumpAndSettle();

    expect(find.text('Southsea Cinema & Arts Centre'), findsOneWidget);
    expect(find.text('The Maze Runner'), findsOneWidget);
    expect(find.text('The Hunger Games'), findsOneWidget);
    expect(find.text('BOOK NOW'), findsNWidgets(2));
    expect(find.byTooltip('Open basket'), findsOneWidget);
  });

  testWidgets('Basket button opens the basket page',
      (WidgetTester tester) async {
    await tester.pumpWidget(const SouthseaCinemaApp());

    await tester.pump();
    await tester.pump(const Duration(seconds: 1));

    expect(find.byTooltip('Open basket'), findsOneWidget);

    await tester.tap(find.byTooltip('Open basket'));

    await tester.pump();
    await tester.pump(const Duration(milliseconds: 500));

    expect(find.text('My Basket'), findsOneWidget);
  });
}
