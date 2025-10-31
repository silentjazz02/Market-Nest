// dart
import 'package:flutter/material.dart';
import 'package:marketnest/core/theme/Utils.dart';

class StarRating extends StatelessWidget {
  final double rating; // decimal rating between 0 and 5
  final double size;
  final Color color;
  final bool showValue; // show numeric rating next to stars
  final int? reviewCount; // optional review count to display

  const StarRating({
    super.key,
    required this.rating,
    this.size = 20,
    this.color = Colors.amber,
    this.showValue = true,
    this.reviewCount,
  });

  Icon _iconForIndex(int index, double rating) {
    // index is 1..5
    if (rating >= index) {
      return Icon(Icons.star, size: size, color: color);
    } else if (rating >= index - 0.5) {
      return Icon(Icons.star_half, size: size, color: color);
    } else {
      return Icon(Icons.star_border, size: size, color: color.withOpacity(0.9));
    }
  }

  @override
  Widget build(BuildContext context) {
    final clamped = rating.clamp(0.0, 5.0);
    final stars = List<Widget>.generate(5, (i) => _iconForIndex(i + 1, clamped));

    final texts = <Widget>[];
    if (showValue) {
      texts.add(const SizedBox(width: 8));
      texts.add(Text(
        clamped.toStringAsFixed(1),
        style: context.theme.textTheme.titleMedium,
      ));
    }
    if (reviewCount != null) {
      texts.add(const SizedBox(width: 6));
      texts.add(Text(
        '(${reviewCount})',
        style: context.theme.textTheme.titleMedium,
      ));
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...stars,
        ...texts,
      ],
    );
  }
}
