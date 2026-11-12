import 'package:southsea_cinema/models/movie.dart';
import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
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
  int _ticketQuantity = 0;
  String _bookingMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(appTitle, style: cinemaHeaderStyle),
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
              Text(
  '${widget.movie.title} (${widget.movie.ageRating})',
  style: const TextStyle(
    fontSize: 28,
    color: cinemaFontWhite,
  ),
),
const SizedBox(height: 20),

Image.asset(
  widget.movie.imagePath,
  height: 220,
  width: double.infinity,
  fit: BoxFit.contain,
),

              const SizedBox(height: 40),

              const Text(
                'Southsea Cinema Room',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              const Text(
                'Thursday 15 Oct 2026, 18:00 - ends at 19:53',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 50),

              const Text(
                'Please note that Discounts / Membership Benefits '
                'will be applied once you have selected your tickets',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 22),

              const Text(
                'Select Quantities (Up to 5 in total)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 44),

              const Text(
                'Tickets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  DropdownMenu<int>(
                    initialSelection: _ticketQuantity,
                    onSelected: (int? value) {
                      if (value != null) {
                        setState(() {
                          _ticketQuantity = value;
                         print('Tickets selected: $_ticketQuantity');
                        });
                      }
                    },
                    dropdownMenuEntries: [
                      DropdownMenuEntry(value: 0, label: '0'),
                      DropdownMenuEntry(value: 1, label: '1'),
                      DropdownMenuEntry(value: 2, label: '2'),
                      DropdownMenuEntry(value: 3, label: '3'),
                      DropdownMenuEntry(value: 4, label: '4'),
                      DropdownMenuEntry(value: 5, label: '5'),
                    ],
                  ),

                  const SizedBox(width: 12),

                  const Text(
                    'Adult (£7.50)',
                    style: TextStyle(
                      fontSize: 16,
                      color: cinemaBrand,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 34),

              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _bookingMessage =
                        'Added $_ticketQuantity tickets to the order';
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



// Add a function(ality) when elevated button is pressed and also use the variable in a text

