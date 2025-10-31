import 'package:flutter/material.dart';
import 'package:marketnest/app/modules/productDetails/screens/productDetailsScreen.dart';
import 'package:marketnest/app/modules/productListing/screens/productListScreen.dart';
import 'package:marketnest/app/splashScreen.dart';

import '../constants/routeNames.dart';

class Routes {
  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case RouteNames.splashScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.splashScreen),
          builder: (BuildContext context) => const SplashScreen(),
        );
      case RouteNames.productListScreen:
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.productListScreen),
          builder: (BuildContext context) => const ProductListScreen(),
        );
      case RouteNames.productDetailsScreen:
        final data = settings.arguments! as Map;
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.productDetailsScreen),
          builder: (BuildContext context) => ProductDetailsScreen(product: data['product']),
        );

      default:
        // Unknown route - navigate to main section
        debugPrint('⚠️ Routes: Unknown route: ${settings.name}');
        return MaterialPageRoute(
          settings: const RouteSettings(name: RouteNames.splashScreen),
          builder: (BuildContext context) => const SplashScreen(),
        );
    }
  }
}
