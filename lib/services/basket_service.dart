
import 'package:southsea_cinema/models/movie.dart';

class BasketItem {
  final Movie movie;
  int quantity;

  BasketItem({
    required this.movie,
    required this.quantity,
  });

  double get totalPrice {
    return movie.ticketPrice * quantity;
  }
}

class BasketService {
  static final List<BasketItem> items = [];

  // Calculate how many tickets are currently in the basket.
  static int get totalQuantity {
    int total = 0;

    for (BasketItem item in items) {
      total += item.quantity;
    }

    return total;
  }

  // Add a movie, provided the five-ticket limit is not exceeded.
  static bool addMovie(Movie movie, int quantity) {
    if (totalQuantity + quantity > 5) {
      return false;
    }

    final existingIndex = items.indexWhere(
      (item) => item.movie.id == movie.id,
    );

    if (existingIndex != -1) {
      items[existingIndex].quantity += quantity;
    } else {
      items.add(
        BasketItem(
          movie: movie,
          quantity: quantity,
        ),
      );
    }

    return true;
  }

  // Calculate the total basket price.
  static double get totalPrice {
    double total = 0;

    for (BasketItem item in items) {
      total += item.totalPrice;
    }

    return total;
  }

  // Remove a movie from the basket.
  static void removeMovie(int index) {
    items.removeAt(index);
  }

  // Empty the basket after a booking is confirmed.
  static void clearBasket() {
    items.clear();
  }
}
