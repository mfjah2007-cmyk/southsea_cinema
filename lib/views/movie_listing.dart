import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';

class MovieListing extends StatelessWidget {
  const MovieListing({super.key});

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
              // Movie title
              const Text(
                'The Maze Runner (2014) (PG-13)',
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 40),

              // Cinema room
              const Text(
                'Southsea Cinema Room',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 20),

              // Screening date and time
              const Text(
                'Thursday 15 Oct 2026, 18:00 - ends at 19:53',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 50),

              // Discounts notice
              const Text(
                'Please note that Discounts / Membership Benefits '
                'will be applied once you have selected your tickets',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 22),

              // Ticket quantity instructions
              const Text(
                'Select Quantities (Up to 5 in total)',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 44),

              // Tickets heading
              const Text(
                'Tickets',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              const SizedBox(height: 12),

              // Ticket quantity and price
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey),
                    ),
                    child: DropdownButton<int>(
                      value: 0,
                      underline: const SizedBox.shrink(),
                      items: List.generate(
                        6,
                        (index) => DropdownMenuItem(
                          value: index,
                          child: Text('$index'),
                        ),
                      ),
                      onChanged: (value) {},
                    ),
                  ),

                  const SizedBox(width: 12),

                  const Text(
                    'Adult (£7.50)',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 34),

              // Add to order button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: cinemaBrand,
                  foregroundColor: cinemaFontWhite,
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.zero,
                  ),
                ),
                child: const Text('ADD TO ORDER'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}

