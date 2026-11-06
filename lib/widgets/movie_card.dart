
import 'package:flutter/material.dart';
import 'package:southsea_cinema/models/movie.dart';

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
            Image.asset(
              movie.imagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 10),

            Text(
              movie.title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 5),

            Text('Age Rating: ${movie.ageRating}'),

            const SizedBox(height: 5),

            Text(movie.synopsis),

            const SizedBox(height: 5),

            Text('Screening: ${movie.screeningTime}'),

            const SizedBox(height: 5),

            Text('Adult Ticket: £${movie.ticketPrice.toStringAsFixed(2)}'),

            const SizedBox(height: 10),

            ElevatedButton(
              onPressed: onBook,
              child: const Text('BOOK NOW'),
            ),
          ],
        ),
      ),
    );
  }
}
