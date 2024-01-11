import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  Future<dynamic> pushReplaceMent(
      {required String routeName, dynamic argument}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: argument);
  }

  Future<dynamic> push({required String routeName, dynamic argument}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: argument);
  }

  void popUntil({required String routeName, dynamic argument}) {
    return navigatorKey.currentState!.popUntil((route) {
      return route.settings.name == routeName;
    });
  }

  Future<dynamic> pushAndRemoveUntil(
      {required String routeName, dynamic argument}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
      routeName,
      (route) => false,
      arguments: argument,
    );
  }
}
