// dart
import 'package:flutter/material.dart';

class StockDescription extends StatelessWidget {
  final bool inStock;
  final String description;

  const StockDescription({super.key, required this.inStock, required this.description});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(inStock ? Icons.check_circle : Icons.error_outline, color: inStock ? Colors.tealAccent : Colors.redAccent, size: 18),
            const SizedBox(width: 8),
            Text(inStock ? 'In Stock' : 'Out of stock', style: TextStyle(color: inStock ? Colors.tealAccent : Colors.redAccent)),
          ],
        ),
        const SizedBox(height: 10),
        Text(description, style: const TextStyle(color: Colors.white70, height: 1.4)),
      ],
    );
  }
}
