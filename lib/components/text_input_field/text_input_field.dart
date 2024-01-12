import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tezda_assessment/constant/colors.dart';
import 'package:tezda_assessment/constant/input_validators.dart';
import 'package:tezda_assessment/constant/styles.dart';
import 'package:tezda_assessment/models/data_input_model/data_input_model.dart';

enum InputFieldType { normal, password, email, name }

class AppTextField extends StatefulWidget {
  const AppTextField({
    this.controller,
    this.onChangedWithInputValidators,
    this.hintText,
    this.onChanged,
    this.inputType,
    this.inputFieldType = InputFieldType.normal,
    this.inputErrorOccur = false,
    super.key,
  });

  final TextEditingController? controller;
  final String? hintText;
  final bool inputErrorOccur;
  final Function(String value)? onChanged;
  final Function(DataInputModel data)? onChangedWithInputValidators;
  final InputFieldType inputFieldType;
  final TextInputType? inputType;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool showpassword = false;
  toggleShowPassword() {
    showpassword = !showpassword;
    setState(() {});
  }

  bool handleInputValidators(String data) {
    switch (widget.inputFieldType) {
      case InputFieldType.normal:
        return true;
      case InputFieldType.email:
        return InputValidators.validateEmail(data);
      case InputFieldType.password:
        return InputValidators.validatePassword(data);
      case InputFieldType.name:
        return InputValidators.validateName(data);
    }
  }

  String? handleErrorText() {
    switch (widget.inputFieldType) {
      case InputFieldType.normal:
        return null;
      case InputFieldType.email:
        return "Invalid Email address";
      case InputFieldType.password:
        return "Invalid Password";
      case InputFieldType.name:
        return "Invalid input";
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.black,
      controller: widget.controller,
      obscureText: showpassword,
      onChanged: (value) {
        if (widget.onChanged != null) {
          widget.onChanged!(value);
        }
        if (widget.onChangedWithInputValidators != null) {
          widget.onChangedWithInputValidators!(
            DataInputModel(
              isNotValid: !handleInputValidators(value),
              isValid: handleInputValidators(value),
              data: value,
            ),
          );
        }
      },
      keyboardType: widget.inputType,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 13, horizontal: 20),
        suffixIcon: (widget.inputFieldType == InputFieldType.password
            ? InkWell(
                onTap: () {
                  toggleShowPassword();
                },
                child: Icon(
                  showpassword ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.neutral,
                ),
              )
            : const SizedBox()),
        labelText: widget.hintText ?? '',
        labelStyle: TextStyles.regular14,
        hintStyle: TextStyles.regular14,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.neutral3,
            width: 1,
          ),
        ),
        errorText: widget.inputErrorOccur ? handleErrorText() : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.neutral3,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.red3,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.red3,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(
            color: AppColors.neutral3,
            width: 1,
          ),
        ),
      ),
    );
  }
}

class PhoneNumberTextField extends StatelessWidget {
  const PhoneNumberTextField({
    super.key,
    this.phoneController,
    this.onChanged,
    this.onInputValidate,
    this.inputErrorOccur = false,
  });

  final bool inputErrorOccur;
  final TextEditingController? phoneController;
  final Function(String value)? onChanged;
  final Function(bool value)? onInputValidate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: InputDecorator(
        decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.neutral3,
              width: 1,
            ),
          ),
          errorText: inputErrorOccur ? "Invalid Phone number" : null,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.neutral3,
              width: 1,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.red3,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: AppColors.neutral3,
              width: 1,
            ),
          ),
        ),
        child: InternationalPhoneNumberInput(
          onInputChanged: (PhoneNumber number) {
            if (kDebugMode) {
              print(number.phoneNumber);
            }
            if (onChanged != null) {
              onChanged!(number.phoneNumber.toString());
            }
          },
          onInputValidated: (bool value) {
            if (kDebugMode) {
              print(value);
            }
            if (onInputValidate != null) {
              onInputValidate!(value);
            }
          },
          ignoreBlank: true,
          autoValidateMode: AutovalidateMode.disabled,
          initialValue: PhoneNumber(isoCode: 'NG'),
          textFieldController: phoneController,
          inputBorder: InputBorder.none,
          selectorConfig: const SelectorConfig(
            selectorType: PhoneInputSelectorType.DIALOG,
          ),
        ),
      ),
    );
  }
}
