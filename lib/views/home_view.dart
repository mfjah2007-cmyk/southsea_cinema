import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/repositories/movie_repository.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/widgets/movie_card.dart';
import 'package:southsea_cinema/views/movie_listing.dart';
import 'package:southsea_cinema/widgets/basket_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Load all movies from the JSON repository.
    final moviesFuture = MovieRepository().getMovies();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          appTitle,
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

      // Wait for the movies to load before displaying them.
      body: FutureBuilder(
        future: moviesFuture,
        builder: (context, snapshot) {
          // Show a loading indicator while the movies load.
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Display an error if the movies cannot be loaded.
          if (snapshot.hasError) {
            return const Center(
              child: Text('Unable to load movies.'),
            );
          }

          // Get the loaded movie list.
          final movies = snapshot.data ?? [];

          // Display a message if there are no movies.
          if (movies.isEmpty) {
            return const Center(
              child: Text('No movies available.'),
            );
          }

          // Display the movies.
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              return MovieCard(
                movie: movies[index],
                onBook: () {
                  // Open the booking page for the selected movie.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieListing(
                        movie: movies[index],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
