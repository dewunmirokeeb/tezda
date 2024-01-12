import 'package:flutter/material.dart';
import 'package:tezda_assessment/components/buttons/app_button.dart';
import 'package:tezda_assessment/components/text_input_field/text_input_field.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/constant/styles.dart';
import 'package:tezda_assessment/core/app_set_up/base_view.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/dialog_service/dialog_service.dart';
import 'package:tezda_assessment/features/authentication/view_model/auth_view_model.dart';
import 'package:tezda_assessment/features/authentication/views/login_page.dart';
import 'package:tezda_assessment/features/authentication/views/password_validator_widget.dart';

class CreatePasswordPage extends StatefulWidget {
  const CreatePasswordPage({super.key});
  static const String routeName = "auth/password/create";

  @override
  State<CreatePasswordPage> createState() => _CreatePasswordPageState();
}

class _CreatePasswordPageState extends State<CreatePasswordPage> {
  bool isAllowTermsOfService = false;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      provider: authenticationViewModelProvider,
      builder: (context, model, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.white,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Create Password",
                    style: TextStyles.bold24,
                  ),
                ),
                const SizedBox(height: 8),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "To keep your account safe and secure, kindly create a password. ",
                    style: TextStyles.regular14,
                  ),
                ),
                const SizedBox(height: 20),
                AppTextField(
                  inputErrorOccur: false,
                  hintText: "Password",
                  onChanged: (value) {
                    model.onChangePassword(value);
                  },
                  inputFieldType: InputFieldType.password,
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: PassWordValidatorWidget(
                    passwordValidatorModel: model.passwordValid,
                  ),
                ),
                const SizedBox(height: 30),
                AppTextField(
                  hintText: "Confirm Password",
                  inputErrorOccur: model.confirmPassword?.isNotValid ?? false,
                  onChanged: (value) {
                    model.onChangeConfirmPassword(value);
                  },
                  inputFieldType: InputFieldType.password,
                ),
                const SizedBox(height: 50),
                AppButton(
                  onTap: () {
                    dialogService.showSuccessToast(
                        message: "Account created successfully");
                    navigator.pushAndRemoveUntil(
                      routeName: LoginPage.routeName,
                    );
                  },
                  buttonText: "Next",
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
