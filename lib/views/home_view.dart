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
    // Get all the movies from the repository.
    final movies = MovieRepository().getMovies();

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
          ]),

      drawer: const NavDrawer(),

      // Display all movies on the home page.
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return MovieCard(
            movie: movies[index],
            onBook: () {
              // Open a separate booking page for the selected movie.
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
      ),
    );
  }
}
