import 'package:flutter/material.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/core/route_service/navigation_service.dart';

class SpaceConstants {
  static double screenHeight() {
    return MediaQuery.of(
            locatorX<NavigationService>().navigatorKey.currentContext!)
        .size
        .height;
  }

  static double screenWidth() {
    return MediaQuery.of(
            locatorX<NavigationService>().navigatorKey.currentContext!)
        .size
        .width;
  }
}
