import 'package:flutter/material.dart';
import 'package:tezda_assessment/features/authentication/views/create_password.dart';
import 'package:tezda_assessment/features/authentication/views/login_page.dart';
import 'package:tezda_assessment/features/authentication/views/signup_screen.dart';
import 'package:tezda_assessment/features/onboarding/onboarding.dart';

Route<RouteSettings> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    //Authentication
    case OnboardingScreen.routeName:
      return MaterialPageRoute(
        builder: (_) => const OnboardingScreen(),
        settings: routeSettings,
      );
    case SignUpPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const SignUpPage(),
        settings: routeSettings,
      );

    case CreatePasswordPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const CreatePasswordPage(),
        settings: routeSettings,
      );

    // case RegulatoryIdPage.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const RegulatoryIdPage(),
    //     settings: routeSettings,
    //   );

    // case OTPPage.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const OTPPage(),
    //     settings: routeSettings,
    //   );

    case LoginPage.routeName:
      return MaterialPageRoute(
        builder: (_) => const LoginPage(),
        settings: routeSettings,
      );

    // case ForgotPassword.routeName:
    //   return MaterialPageRoute(
    //     builder: (_) => const ForgotPassword(),
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
