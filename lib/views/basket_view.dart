
import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/services/basket_service.dart';
import 'package:southsea_cinema/widgets/nav_drawer.dart';
import 'package:southsea_cinema/views/checkout_view.dart';

class BasketView extends StatefulWidget {
  const BasketView({super.key});

  @override
  State<BasketView> createState() => _BasketViewState();
}

class _BasketViewState extends State<BasketView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Basket',
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),

      drawer: const NavDrawer(),

      body: BasketService.items.isEmpty
          ? const Center(
              child: Text(
                'Your basket is empty.',
                style: TextStyle(
                  fontSize: 18,
                  color: cinemaFontWhite,
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(12),
              children: [

                // Display every movie in the basket.
                for (int i = 0; i < BasketService.items.length; i++)
                  Card(
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text(
                            BasketService.items[i].movie.title,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 8),

                          Text(
                            'Tickets: ${BasketService.items[i].quantity}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            'Price per ticket: £${BasketService.items[i].movie.ticketPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            'Subtotal: £${BasketService.items[i].totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),

                          const SizedBox(height: 8),

                          // Remove the selected movie.
                          TextButton(
                            onPressed: () {
                              setState(() {
                                BasketService.removeMovie(i);
                              });
                            },
                            child: const Text('REMOVE'),
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(height: 15),

                // Display the overall basket total.
                Text(
                  'Basket Total: £${BasketService.totalPrice.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: cinemaFontWhite,
                  ),
                ),

                const SizedBox(height: 20),

                // Open the checkout page.
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CheckoutView(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: cinemaBrand,
                    foregroundColor: cinemaFontWhite,
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('PROCEED TO CHECKOUT'),
                ),
              ],
            ),
    );
  }
}
