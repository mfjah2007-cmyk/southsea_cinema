
import 'package:flutter/material.dart';
import 'package:southsea_cinema/constants.dart';

// A reusable button for the cinema application.
class PrimaryButton extends StatelessWidget {
  // Text displayed inside the button.
  final String label;

  // Function executed when the button is pressed.
  final VoidCallback onPressed;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: cinemaBrand,
        foregroundColor: cinemaFontWhite,
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
