import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/core/local_database/local_db.dart';
import 'package:tezda_assessment/core/local_database/local_db_string.dart';
import 'package:tezda_assessment/features/authentication/views/login_page.dart';
import 'package:tezda_assessment/features/onboarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTime();
  }

  startTime() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, route);
  }

  int appOpenState = StorageUtil.getInt(key: LocalDataBaseKeys.userOnboardingState);
  route() async {
    if (appOpenState == 0) {
      navigator.pushReplaceMent(routeName: OnboardingScreen.routeName);
    } else {
      navigator.pushReplaceMent(routeName: LoginPage.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/images/logo.png',
              width: 228,
            ),
          ],
        ),
      ),
    );
  }
}
