import 'package:flutter/material.dart';
import 'package:tezda_assessment/models/data_input_model/password_validator_model.dart';
import 'package:tezda_assessment/widget/check_box.dart';

class PassWordValidatorWidget extends StatelessWidget {
  const PassWordValidatorWidget({
    required this.passwordValidatorModel,
    super.key,
  });

  final PasswordValidatorModel passwordValidatorModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: PassWordValidatorCheckBox(
                checked: passwordValidatorModel.hasUpperCase,
                text: "Uppercase letter",
              ),
            ),
            Expanded(
              child: PassWordValidatorCheckBox(
                checked: passwordValidatorModel.hasLowerCase,
                text: "Lowercase letter",
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: PassWordValidatorCheckBox(
                checked: passwordValidatorModel.hasNumber,
                text: "Number",
              ),
            ),
            Expanded(
              child: PassWordValidatorCheckBox(
                checked: passwordValidatorModel.hasSpecialCharacter,
                text: "Special Character",
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: PassWordValidatorCheckBox(
                checked: passwordValidatorModel.isMinimum8CharTrue,
                text: "Minimum of 8 Characters",
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
      ],
    );
  }
}
