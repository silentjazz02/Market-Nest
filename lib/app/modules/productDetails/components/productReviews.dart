// dart
import 'package:flutter/material.dart';
import 'package:marketnest/app/modules/productListing/models/productReviewModel.dart';
import 'package:marketnest/core/theme/Utils.dart';

class ReviewsList extends StatelessWidget {
  final List<ProductReview> reviews;

  const ReviewsList({super.key, this.reviews = const []});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: reviews
          .map(
            (r) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: ReviewTile(data: r),
                ),
                Divider(color: context.colorPalette.border, height: 1),
              ],
            ),
          )
          .toList(),
    );
  }
}

class ReviewItemData {
  final String author;
  final String text;
  final double rating;
  final String avatarUrl;

  ReviewItemData({
    required this.author,
    required this.text,
    required this.rating,
    this.avatarUrl = '',
  });
}

class ReviewTile extends StatelessWidget {
  final ProductReview data;

  const ReviewTile({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: context.colorPalette.border,
          child: Text(
            data.reviewerName![0].toUpperCase(),
            style: context.theme.textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w700,
              color: context.colorPalette.textSecondary,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data.reviewerName ?? '', style: context.theme.textTheme.titleMedium),
              const SizedBox(height: 4),
              Text(data.comment ?? '', style: context.theme.textTheme.bodyMedium,),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Row(
          children: [
            Text(data.rating!.toStringAsFixed(1), style: TextStyle(color: context.colorPalette.primary)),
            const SizedBox(width: 4),
            Icon(Icons.star, size: 16, color: context.colorPalette.primary)
          ],
        )
      ],
    );
  }
}
