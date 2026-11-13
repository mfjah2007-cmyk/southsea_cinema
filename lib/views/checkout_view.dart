
import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/services/basket_service.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  // This key allows us to validate the form.
  final _formKey = GlobalKey<FormState>();

  // Controllers store the customer's information.
  final TextEditingController _nameController =
      TextEditingController();

  final TextEditingController _emailController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers when the page is closed.
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // Check that the customer's details have been entered.
  void _continueToConfirmation() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Details accepted. Ready for booking confirmation.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Checkout',
          style: cinemaHeaderStyle,
        ),
        backgroundColor: cinemaSurface,
        iconTheme: const IconThemeData(color: cinemaBrand),
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Text(
              'Order Summary',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: cinemaFontWhite,
              ),
            ),

            const SizedBox(height: 15),

            // Display every movie in the basket.
            for (BasketItem item in BasketService.items)
              Card(
                color: Colors.white,
                child: ListTile(
                  title: Text(
                    item.movie.title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    '${item.quantity} tickets',
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  trailing: Text(
                    '£${item.totalPrice.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

            const SizedBox(height: 15),

            // Display the overall price.
            Text(
              'Total: £${BasketService.totalPrice.toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: cinemaFontWhite,
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              'Customer Details',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: cinemaFontWhite,
              ),
            ),

            const SizedBox(height: 15),

            // Customer information form.
            Form(
              key: _formKey,
              child: Column(
                children: [

                  // Customer name.
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Full Name',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Please enter your name.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 20),

                  // Customer email address.
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null ||
                          !RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$')
                              .hasMatch(value.trim())) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 30),

                  // Continue to the booking confirmation step.
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _continueToConfirmation,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cinemaBrand,
                        foregroundColor: cinemaFontWhite,
                        padding: const EdgeInsets.all(15),
                      ),
                      child: const Text(
                        'CONTINUE TO CONFIRMATION',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
