import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';
import 'package:southsea_cinema/services/basket_service.dart';

class CheckoutView extends StatefulWidget {
  const CheckoutView({super.key});

  @override
  State<CheckoutView> createState() => _CheckoutViewState();
}

class _CheckoutViewState extends State<CheckoutView> {
  // Used to validate the customer details form.
  final _formKey = GlobalKey<FormState>();

  // Store the customer's name and email.
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  // Store the confirmed booking information.
  bool _bookingConfirmed = false;
  String _confirmedName = '';
  String _confirmedEmail = '';
  double _confirmedTotal = 0;
  int _confirmedTickets = 0;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  // Confirm the booking after validating the form.
  void _confirmBooking() {
    if (_formKey.currentState!.validate()) {
      // Save the order information before clearing the basket.
      final customerName = _nameController.text.trim();
      final customerEmail = _emailController.text.trim();
      final orderTotal = BasketService.totalPrice;
      final ticketCount = BasketService.totalQuantity;

      setState(() {
        _confirmedName = customerName;
        _confirmedEmail = customerEmail;
        _confirmedTotal = orderTotal;
        _confirmedTickets = ticketCount;

        _bookingConfirmed = true;
      });

      // Empty the basket after confirmation.
      BasketService.clearBasket();
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

      // Show the confirmation screen after booking.
      body: _bookingConfirmed
          ? Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                      size: 80,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Booking Confirmed!',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: cinemaFontWhite,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Thank you, $_confirmedName.',
                      style: const TextStyle(
                        fontSize: 18,
                        color: cinemaFontWhite,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Confirmation email: $_confirmedEmail',
                      style: const TextStyle(
                        color: cinemaFontWhite,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Tickets booked: $_confirmedTickets',
                      style: const TextStyle(
                        color: cinemaFontWhite,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Total: £${_confirmedTotal.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: cinemaFontWhite,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      'Your booking has been confirmed in this demonstration.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: cinemaFontWhite,
                      ),
                    ),
                    const SizedBox(height: 25),
                    ElevatedButton(
                      onPressed: () {
                        // Return to the home page.
                        Navigator.of(context)
                            .popUntil((route) => route.isFirst);
                      },
                      child: const Text('RETURN TO HOME'),
                    ),
                  ],
                ),
              ),
            )

          // Otherwise, display the checkout form.
          : SingleChildScrollView(
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

                  // Display each movie in the basket.
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
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          decoration: const InputDecoration(
                            labelText: 'Email Address',
                            border: OutlineInputBorder(),
                          ),
                          validator: (value) {
                            if (value == null ||
                                !RegExp(
                                  r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                                ).hasMatch(value.trim())) {
                              return 'Please enter a valid email address.';
                            }

                            return null;
                          },
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: BasketService.items.isEmpty
                                ? null
                                : _confirmBooking,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: cinemaBrand,
                              foregroundColor: cinemaFontWhite,
                              padding: const EdgeInsets.all(15),
                            ),
                            child: const Text('CONFIRM BOOKING'),
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
