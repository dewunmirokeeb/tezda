import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/core/local_database/local_db_string.dart';

Future<void> appSetUp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageUtil.getInstance();
  setUpLocatorX();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );
}
