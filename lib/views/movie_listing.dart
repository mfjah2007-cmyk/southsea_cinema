import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/services/basket_service.dart';
import 'package:southsea_cinema/views/basket_view.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';

class MovieListing extends StatefulWidget {
  final Movie movie;

  const MovieListing({
    super.key,
    required this.movie,
  });

  @override
  State<MovieListing> createState() => _MovieListingState();
}

class _MovieListingState extends State<MovieListing> {
  int _ticketQuantity = 0;
  String _bookingMessage = '';

  // Calculate the total price for the selected tickets.
  double get _totalPrice {
    return _ticketQuantity * widget.movie.ticketPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.movie.title,
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
        actions: const [
          BasketButton(),
        ],
      ),
      drawer: const NavDrawer(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(5),
          padding: const EdgeInsets.all(18),
          color: cinemaSurface,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display the movie title and age rating.
              Text(
                '${widget.movie.title} (${widget.movie.ageRating})',
                style: const TextStyle(
                  fontSize: 28,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 20),

              // Display the complete movie poster.
              SizedBox(
                height: 220,
                width: double.infinity,
                child: Image.asset(
                  widget.movie.imagePath,
                  fit: BoxFit.contain,
                ),
              ),

              const SizedBox(height: 20),

              // Display the movie synopsis.
              Text(
                widget.movie.synopsis,
                style: const TextStyle(
                  fontSize: 16,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Southsea Cinema Room',
                style: TextStyle(
                  fontSize: 16,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 20),

              // Display the screening date and time.
              Text(
                widget.movie.screeningTime,
                style: const TextStyle(
                  fontSize: 16,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Select Quantities (Up to 5 in total)',
                style: TextStyle(
                  fontSize: 16,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Tickets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 12),

              // Allow customers to select their ticket quantity.
              Row(
                children: [
                  DropdownMenu<int>(
                    initialSelection: _ticketQuantity,
                    onSelected: (int? value) {
                      if (value != null) {
                        setState(() {
                          _ticketQuantity = value;
                          _bookingMessage = '';
                        });
                      }
                    },
                    dropdownMenuEntries: [
                      for (int i = 0; i <= 5; i++)
                        DropdownMenuEntry<int>(
                          value: i,
                          label: '$i',
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Text(
                    'Adult (${widget.movie.formattedPrice})',
                    style: const TextStyle(
                      fontSize: 16,
                      color: cinemaBrand,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Display the calculated total price.
              Text(
                'Total: £${_totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 30),

              // Add the selected tickets to the basket.
              ElevatedButton(
                onPressed: () {
                  if (_ticketQuantity == 0) {
                    setState(() {
                      _bookingMessage = 'Please select at least one ticket.';
                    });
                  } else {
                    // Try to add the tickets to the basket.
                    bool added = BasketService.instance.addMovie(
                      widget.movie,
                      _ticketQuantity,
                    );

                    setState(() {
                      if (added) {
                        _bookingMessage =
                            'Added $_ticketQuantity tickets to your basket.';
                      } else {
                        _bookingMessage =
                            'You can only order 5 tickets in total.';
                      }
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('ADD TO ORDER'),
              ),

              const SizedBox(height: 15),

              // Display the booking confirmation.
              Text(
                _bookingMessage,
                style: const TextStyle(
                  fontSize: 16,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 20),

              // Navigate to the basket page.
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BasketView(),
                    ),
                  );
                },
                child: const Text('VIEW BASKET'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
