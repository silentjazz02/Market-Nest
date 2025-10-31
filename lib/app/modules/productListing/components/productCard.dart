// dart
import 'package:flutter/material.dart';
import 'package:marketnest/core/theme/Utils.dart';
import '../models/productModel.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback? onTap;

  const ProductCard({Key? key, required this.product, this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final imageBg = isDark ? Colors.grey.shade900 : Colors.grey.shade100;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: context.colorPalette.surface,
          borderRadius: BorderRadius.circular(14),
          boxShadow: [
            BoxShadow(
              color: isDark ? Colors.black45 : Colors.grey.withOpacity(0.12),
              blurRadius: 18,
              offset: Offset(0, 8),
            ),
          ],
        ),
        padding: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // image area
            Container(
              height: 120,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.thumbnail ?? '',
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Center(
                    child: Icon(Icons.image, size: 32, color: Colors.grey),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text(
              product.title ?? '',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            if (product.brand != null) ...[
              SizedBox(height: 4),
              Text(
                product.brand ?? '',
                style: theme.textTheme.bodySmall,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            SizedBox(height: 4),
            Text(
              product.description ?? '',
              style: theme.textTheme.bodyMedium,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 8),
            Row(
              children: [
                // rating stars
                Icon(Icons.star, size: 14, color: Colors.tealAccent.shade400),
                SizedBox(width: 4),
                Text(
                  product.rating!.toStringAsFixed(1),
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: Colors.tealAccent.shade400,
                  ),
                ),
                Spacer(),
                // price
                Text(
                  '\$${product.price?.toStringAsFixed(2)}',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 6),
            Align(
              alignment: Alignment.bottomRight,
              child: Text(
                product.availabilityStatus == AvailabilityStatus.IN_STOCK
                    ? 'In Stock'
                    : 'Out of Stock',
                style: theme.textTheme.bodySmall?.copyWith(
                  color:
                      product.availabilityStatus == AvailabilityStatus.IN_STOCK
                      ? context.colorPalette.primary
                      : Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
