// dart
import 'package:flutter/material.dart';
import 'package:marketnest/core/theme/Utils.dart';

class TitlePriceSection extends StatelessWidget {
  final String title;
  final String vendor;
  final double price;
  final String description;

  const TitlePriceSection({
    super.key,
    required this.title,
    required this.vendor,
    required this.price,
    this.description = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: context.theme.textTheme.headlineLarge),
        const SizedBox(height: 6),
        Text('$vendor', style: context.theme.textTheme.bodySmall?.copyWith(color: context.colorPalette.textSecondary)),
        const SizedBox(height: 10),
        Text('\$${price.toStringAsFixed(2)}', style: context.theme.textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: 10),
        Text(description, style: context.theme.textTheme.bodyMedium?.copyWith(color: context.colorPalette.textSecondary)),

      ],
    );
  }
}
