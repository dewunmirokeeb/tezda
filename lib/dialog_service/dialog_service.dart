import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/core/route_service/navigation_service.dart';

DialogService dialogService = DialogService();

class DialogService {
  final newContext = locatorX<NavigationService>().navigatorKey.currentContext!;

  void showErrorToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.red3,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void showSuccessToast({required String message}) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 5,
      backgroundColor: AppColors.green3,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  void hideLoaderDialog({int numberOfpop = 1}) {
    for (int i = 0; i < numberOfpop; i++) {
      Navigator.of(newContext, rootNavigator: true).pop();
    }
  }
}
