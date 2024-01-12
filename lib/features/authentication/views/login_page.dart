import 'package:flutter/material.dart';
import 'package:tezda_assessment/components/buttons/app_button.dart';
import 'package:tezda_assessment/components/buttons/app_text_button.dart';
import 'package:tezda_assessment/components/text_input_field/text_input_field.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/constant/styles.dart';
import 'package:tezda_assessment/core/app_set_up/base_view.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/features/authentication/view_model/auth_view_model.dart';
import 'package:tezda_assessment/features/authentication/views/signup_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static const String routeName = "auth/login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyles.bold24,
                ),
                const SizedBox(height: 50),
                AppTextField(
                  inputFieldType: InputFieldType.email,
                  inputErrorOccur: model.loginEmailAddress?.isNotValid ?? false,
                  hintText: "Email Address",
                  onChangedWithInputValidators: model.onChangeLoginEmailAddress,
                ),
                const SizedBox(height: 30),
                AppTextField(
                  hintText: "Password",
                  inputErrorOccur: false,
                  onChanged: (value) {
                    model.onChangeLoginPassword(value);
                  },
                  inputFieldType: InputFieldType.password,
                ),
                const SizedBox(height: 50),
                AppButton(
                  onTap: () {},
                  buttonText: "Log In",
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyles.regular14,
                    ),
                    const SizedBox(width: 10),
                    AppTextButton(
                      onTap: () {
                        navigator.push(routeName: SignUpPage.routeName);
                      },
                      buttontext: "Create Account",
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
