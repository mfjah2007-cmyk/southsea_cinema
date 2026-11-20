
import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';
import 'package:southsea_cinema/widgets/primary_button.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final VoidCallback onBook;

  const MovieCard({
    super.key,
    required this.movie,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display the full movie poster without cropping it.
            SizedBox(
              height: 180,
              width: double.infinity,
              child: Image.asset(
                movie.imagePath,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 10),

            // Movie title.
            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),

            const SizedBox(height: 5),

            Text(
              'Age Rating: ${movie.ageRating}',
              style: const TextStyle(color: Colors.black),
            ),

            const SizedBox(height: 5),

            Text(
              movie.synopsis,
              style: const TextStyle(color: Colors.black),
            ),

            const SizedBox(height: 5),

            Text(
              'Screening: ${movie.screeningTime}',
              style: const TextStyle(color: Colors.black),
            ),

            const SizedBox(height: 5),

            Text(
              'Adult Ticket: £${movie.ticketPrice.toStringAsFixed(2)}',
              style: const TextStyle(color: Colors.black),
            ),

            const SizedBox(height: 10),

            // Reusable booking button.
            PrimaryButton(
              label: 'BOOK NOW',
              onPressed: onBook,
            ),
          ],
        ),
      ),
    );
  }
}

