import 'package:flutter/material.dart';
import 'package:marketnest/core/constants/routeNames.dart';
import 'package:provider/provider.dart';

import 'app/modules/productListing/provider/productProvider.dart';
import 'core/routes/routes.dart';
import 'core/theme/ColorPalette.dart';
import 'core/theme/Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ProductProvider())],
      child: MaterialApp(
        title: 'Market Nest',
        debugShowCheckedModeBanner: false,
        theme: themeFromPalette(ColorPalette(false)),
        // light theme
        darkTheme: themeFromPalette(ColorPalette(true)),
        // dark theme
        themeMode: ThemeMode.dark,
        onGenerateRoute: Routes.generateRoutes,
        initialRoute: RouteNames.splashScreen,
      ),
    );
  }
}
