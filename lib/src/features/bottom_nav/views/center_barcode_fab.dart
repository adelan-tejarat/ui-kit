import 'package:flutter/material.dart';

class CenterBarcodeFab extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;

  const CenterBarcodeFab({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const CircleBorder(),
      backgroundColor: backgroundColor,
      elevation: 6,
      onPressed: onPressed,
      child: const Icon(Icons.qr_code_scanner, color: Colors.white),
    );
  }
}
