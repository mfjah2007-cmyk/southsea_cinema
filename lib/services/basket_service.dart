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
  // Create one shared instance of BasketService.
  static final BasketService instance = BasketService._internal();

  // Private constructor prevents other instances being created.
  BasketService._internal();

  // The basket's contents.
  final List<BasketItem> items = [];

  // Calculate how many tickets are currently in the basket.
  int get totalQuantity {
    int total = 0;

    for (BasketItem item in items) {
      total += item.quantity;
    }

    return total;
  }

  // Add a movie, provided the five-ticket limit is not exceeded.
  bool addMovie(Movie movie, int quantity) {
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
  double get totalPrice {
    double total = 0;

    for (BasketItem item in items) {
      total += item.totalPrice;
    }

    return total;
  }

  // Remove a movie from the basket.
  void removeMovie(int index) {
    items.removeAt(index);
  }

  // Empty the basket after a booking is confirmed.
  void clearBasket() {
    items.clear();
  }
}
