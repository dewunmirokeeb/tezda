import 'package:flutter/material.dart';
import 'package:tezda_assessment/components/buttons/app_button.dart';
import 'package:tezda_assessment/components/buttons/app_text_button.dart';
import 'package:tezda_assessment/components/text_input_field/text_input_field.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/constant/styles.dart';
import 'package:tezda_assessment/core/app_set_up/base_view.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/features/authentication/view_model/auth_view_model.dart';
import 'package:tezda_assessment/features/authentication/views/login_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});
  static const String routeName = "auth/signup";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  String initialCountry = 'NG';

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
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Personal Details",
                      style: TextStyles.bold24,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Kindly fill in your personal details in order to\ncreate your account.",
                      style: TextStyles.regular14,
                    ),
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    inputFieldType: InputFieldType.name,
                    hintText: "First Name",
                    inputErrorOccur: model.firstName?.isNotValid ?? false,
                    onChangedWithInputValidators: model.onChangeFirstName,
                  ),
                  const SizedBox(height: 30),
                  AppTextField(
                    inputFieldType: InputFieldType.name,
                    hintText: "Last Name",
                    inputErrorOccur: model.lastName?.isNotValid ?? false,
                    onChangedWithInputValidators: model.onChangeLastName,
                  ),
                  const SizedBox(height: 25),
                  PhoneNumberTextField(
                    inputErrorOccur: model.phoneNumber?.isNotValid ?? false,
                    onChanged: (value) {
                      model.onChangePhoneNumber(value);
                    },
                    onInputValidate: (value) {
                      model.onValidatePhoneNumber(value);
                    },
                  ),
                  const SizedBox(height: 25),
                  AppTextField(
                    inputFieldType: InputFieldType.email,
                    inputErrorOccur: model.emailAddress?.isNotValid ?? false,
                    hintText: "Email Address",
                    onChangedWithInputValidators: model.onChangeemailAddress,
                  ),
                  const SizedBox(height: 50),
                  AppButton(
                    onTap: () {
                      model.continueToCreatePassword();
                    },
                    buttonText: "Next",
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyles.regular14,
                      ),
                      const SizedBox(width: 10),
                      AppTextButton(
                        onTap: () {
                          navigator.pushReplaceMent(
                            routeName: LoginPage.routeName,
                          );
                        },
                        buttontext: "Log In",
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
}
