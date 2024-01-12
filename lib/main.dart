import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/core/app_set_up/app.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/core/route_service/navigation_service.dart';
import 'package:tezda_assessment/core/route_service/routes.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart' as pro;
import 'package:tezda_assessment/features/onboarding/splash.dart';

void main() async {
  await appSetUp();
  runApp(
    const pro.ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
      ),
    );

    return NotificationListener<OverscrollIndicatorNotification>(
      onNotification: (oversroll) {
        oversroll.disallowIndicator();
        return true;
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Tezda Assessment",
        theme: ThemeData(
          canvasColor: AppColors.neutral,
          appBarTheme: const AppBarTheme(
            color: AppColors.neutral2,
            foregroundColor: AppColors.neutral3,
            elevation: 0,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          scaffoldBackgroundColor: Colors.white,
          colorScheme: const ColorScheme.light(
            primary: Colors.white,
          ),
          useMaterial3: true,
        ),
        navigatorKey: locatorX<NavigationService>().navigatorKey,
        onGenerateRoute: (settings) => generateRoute(settings),
        home: const SplashScreen(),
      ),
    );
  }
}
