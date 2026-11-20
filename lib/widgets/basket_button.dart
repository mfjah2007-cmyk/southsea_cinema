import 'package:flutter/material.dart';

// A reusable button that opens the basket screen.
class BasketButton extends StatelessWidget {
  const BasketButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.shopping_basket),
      tooltip: 'Open basket',
      onPressed: () {
        // Find the name of the current screen.
        final modalRoute = ModalRoute.of(context);
        final currentRoute = modalRoute?.settings.name ?? '';

        // Only open the basket if it isn't already displayed.
        if (currentRoute != '/basket') {
          Navigator.pushNamed(context, '/basket');
        }
      },
    );
  }
}
