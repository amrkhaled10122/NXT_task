import 'package:flutter/material.dart';
import 'routes_name.dart';
import '../../../module/home/presentation/view/home_screen.dart';

/// Mixin for handling app routing.
mixin AppRouter {
  /// Generates the appropriate route based on the provided settings.
  static Route<dynamic> router(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        // Route for the home screen
        return MaterialPageRoute<dynamic>(
          settings: settings,
          fullscreenDialog: true,
          builder: (BuildContext context) => const HomeScreen(),
        );

      default:
        // Default route for handling unknown routes
        return MaterialPageRoute<dynamic>(
          settings: settings,
          maintainState: false,
          builder: (BuildContext context) => const Scaffold(body: Center(child: Text('Route not found'))),
        );
    }
  }
}
