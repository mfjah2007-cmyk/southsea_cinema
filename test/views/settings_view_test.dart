import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/views/settings_view.dart';

void main() {
  testWidgets('Settings screen displays correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SettingsView(),
      ),
    );

    expect(find.text('Customer Settings'), findsOneWidget);
    expect(find.text('Your Details'), findsOneWidget);
    expect(find.text('Full Name'), findsOneWidget);
    expect(find.text('Address'), findsOneWidget);
    expect(find.text('Email Address'), findsOneWidget);
    expect(find.text('SAVE SETTINGS'), findsOneWidget);
  });

  testWidgets('Customer can save their details', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SettingsView(),
      ),
    );

    await tester.enterText(
      find.widgetWithText(TextField, 'Full Name'),
      'John Smith',
    );

    await tester.enterText(
      find.widgetWithText(TextField, 'Address'),
      '10 High Street',
    );

    await tester.enterText(
      find.widgetWithText(TextField, 'Email Address'),
      'john@example.com',
    );

    await tester.tap(find.text('SAVE SETTINGS'));
    await tester.pumpAndSettle();

    expect(find.text('Name: John Smith'), findsOneWidget);
    expect(find.text('Address: 10 High Street'), findsOneWidget);
    expect(find.text('Email: john@example.com'), findsOneWidget);
    expect(
      find.text('Settings saved successfully!'),
      findsOneWidget,
    );
  });

  testWidgets('Newsletter preference can be enabled',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: SettingsView(),
      ),
    );

    await tester.tap(find.byType(CheckboxListTile));
    await tester.pumpAndSettle();

    await tester.tap(find.text('SAVE SETTINGS'));
    await tester.pumpAndSettle();

    expect(find.text('Newsletter: Yes'), findsOneWidget);
  });
}
