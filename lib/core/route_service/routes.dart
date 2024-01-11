import 'package:flutter/material.dart';

Route<RouteSettings> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    //Authentication
    // case OnboardingScreen.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const OnboardingScreen(),
    //     settings: routeSettings,
    //   );

    default:
      return MaterialPageRoute(
        builder: (_) => const Scaffold(
          body: Center(child: Text('Unknown route')),
        ),
        settings: routeSettings,
      );
  }
}
