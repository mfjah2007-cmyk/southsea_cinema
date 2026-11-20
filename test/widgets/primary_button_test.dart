import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

void main() {
  // Test that the button displays its label.
  testWidgets('PrimaryButton renders its label', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            label: 'BOOK NOW',
            onPressed: () {},
          ),
        ),
      ),
    );

    expect(find.text('BOOK NOW'), findsOneWidget);
  });

  // Test that the button responds when pressed.
  testWidgets('PrimaryButton invokes onPressed when tapped',
      (WidgetTester tester) async {
    bool wasPressed = false;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: PrimaryButton(
            label: 'BOOK NOW',
            onPressed: () {
              wasPressed = true;
            },
          ),
        ),
      ),
    );

    await tester.tap(find.text('BOOK NOW'));
    await tester.pump();

    expect(wasPressed, isTrue);
  });
}
