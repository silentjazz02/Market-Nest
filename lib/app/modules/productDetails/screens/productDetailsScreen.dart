import 'package:flutter/material.dart';
import 'package:marketnest/app/modules/productDetails/components/productImageCarousel.dart';
import 'package:marketnest/app/modules/productDetails/components/productStarRating.dart';
import 'package:marketnest/core/theme/Utils.dart';

import '../../productListing/models/productModel.dart';
import '../components/productReviews.dart';
import '../components/productTitleSection.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductImageCarousel(imageUrls: product.images ?? []),
            const SizedBox(height: 20),
            TitlePriceSection(
              title: product.title ?? '',
              vendor: product.brand ?? '',
              price: product.price ?? 0.0,
              description: product.description ?? '',
            ),
            // const SizedBox(height: 12),
            // StockDescription(
            //   inStock: product.availabilityStatus == AvailabilityStatus.IN_STOCK
            //       ? true
            //       : false,
            //   description: product.description ?? '',
            // ),
            SizedBox(height: context.getScreenHeight(5)),
            Text('CUSTOMER REVIEWS', style: context.theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            StarRating(
              rating: product.rating?.toDouble() ?? 0.0,
              color: context.colorPalette.primary,
              reviewCount: product.reviews?.length,
            ),
            const SizedBox(height: 8),
            ReviewsList(reviews: product.reviews ?? []),
            const SizedBox(height: 18),
          ],
        ),
      ),
    );
  }
}
