import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/models/user_settings.dart';

void main() {
  // Test 1: Check the default settings.
  test('UserSettings has the correct default values', () {
    const settings = UserSettings();

    expect(settings.name, isEmpty);
    expect(settings.address, isEmpty);
    expect(settings.email, isEmpty);
    expect(settings.receiveNewsletter, isFalse);
  });

  // Test 2: Check that custom settings are stored.
  test('UserSettings stores configured values', () {
    const settings = UserSettings(
      name: 'John Smith',
      address: '10 High Street',
      email: 'john@example.com',
      receiveNewsletter: true,
    );

    expect(settings.name, 'John Smith');
    expect(settings.address, '10 High Street');
    expect(settings.email, 'john@example.com');
    expect(settings.receiveNewsletter, isTrue);
  });
}
