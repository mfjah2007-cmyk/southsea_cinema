
import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

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
  // Stores the number of tickets selected.
  int _ticketQuantity = 0;

  // Stores the confirmation message.
  String _bookingMessage = '';

  // Calculate the total ticket price.
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

              // Display the movie poster.
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
                'Please note that Discounts / Membership Benefits '
                'will be applied once you have selected your tickets',
                style: TextStyle(
                  fontSize: 16,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Select Quantities (Up to 5 in total)',
                style: TextStyle(
                  fontSize: 16,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Tickets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 12),

              // Let the customer select their ticket quantity.
              Row(
                children: [
                  DropdownMenu<int>(
                    initialSelection: _ticketQuantity,

                    onSelected: (int? value) {
                      if (value != null) {
                        setState(() {
                          _ticketQuantity = value;

                          // Clear the old confirmation when
                          // the customer changes their selection.
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
                    'Adult (£${widget.movie.ticketPrice.toStringAsFixed(2)})',
                    style: const TextStyle(
                      fontSize: 16,
                      color: cinemaBrand,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Automatically update the total price.
              Text(
                'Total: £${_totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: cinemaFontWhite,
                ),
              ),

              const SizedBox(height: 30),

              // Add the selected tickets to the order.
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_ticketQuantity == 0) {
                      _bookingMessage =
                          'Please select at least one ticket.';
                    } else {
                      _bookingMessage =
                          'Added $_ticketQuantity tickets. '
                          'Total: £${_totalPrice.toStringAsFixed(2)}';
                    }
                  });
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
            ],
          ),
        ),
      ),
    );
  }
}
