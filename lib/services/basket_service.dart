import 'package:southsea_cinema/models/movie.dart';

// Stores one movie and the number of tickets selected.
class BasketItem {
  final Movie movie;
  int quantity;

  BasketItem({
    required this.movie,
    required this.quantity,
  });

  // Calculate the price for this movie.
  double get totalPrice {
    return movie.ticketPrice * quantity;
  }
}

// Stores the customer's basket.
class BasketService {
  // A static list allows different screens to access the same basket.
  static final List<BasketItem> items = [];

  // Add a movie to the basket.
  static void addMovie(Movie movie, int quantity) {
    // Check whether this movie is already in the basket.
    final existingIndex = items.indexWhere(
      (item) => item.movie.id == movie.id,
    );

    if (existingIndex != -1) {
      // Increase the quantity if the movie already exists.
      items[existingIndex].quantity += quantity;
    } else {
      // Otherwise, add a new movie to the basket.
      items.add(
        BasketItem(
          movie: movie,
          quantity: quantity,
        ),
      );
    }
  }

  // Calculate the total cost of the basket.
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
}