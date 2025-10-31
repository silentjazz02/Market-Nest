// dart
import 'package:flutter/material.dart';
import 'package:marketnest/app/modules/productListing/components/noItemCard.dart';
import 'package:marketnest/core/constants/routeNames.dart';
import 'package:marketnest/core/theme/Utils.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/assetsConstants.dart';
import '../components/productCard.dart';
import '../provider/productProvider.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    final provider = Provider.of<ProductProvider>(context, listen: false);
    provider.loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              AssetsConstants.logo,
              width: 25,
              height: 25,
              fit: BoxFit.contain,
            ),
            SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Market Nest',
                  style: context.theme.textTheme.bodyLarge?.copyWith(
                    color: context.colorPalette.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Curated for every desire',
                  style: context.theme.textTheme.bodySmall?.copyWith(
                    color: context.colorPalette.textPrimary,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        // actions: [IconButton(icon: Icon(Icons.search), onPressed: () {})],
      ),
      body: Consumer<ProductProvider>(
        builder: (context, provider, _) {
          if (provider.state == ProductState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (provider.state == ProductState.error) {
            return Center(child: Text('Error: ${provider.error}'));
          } else if (provider.products.isEmpty) {
            return NoItemCard();
          }

          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: GridView.builder(
              itemCount: provider.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: MediaQuery.of(context).size.width > 800 ? 4 : 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                final p = provider.products[index];
                return ProductCard(
                  product: p,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      RouteNames.productDetailsScreen,
                      arguments: {'product': p},
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
