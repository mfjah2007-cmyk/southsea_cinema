import 'package:flutter_test/flutter_test.dart';
import 'package:southsea_cinema/services/basket_service.dart';

void main() {
  // Test that the basket service uses one shared instance.
  test('BasketService returns the same instance', () {
    final firstInstance = BasketService.instance;
    final secondInstance = BasketService.instance;

    expect(firstInstance, same(secondInstance));
  });

  // Test that the basket starts empty.
  test('BasketService can clear its basket', () {
    final basket = BasketService.instance;

    basket.clearBasket();

    expect(basket.items, isEmpty);
  });
}
