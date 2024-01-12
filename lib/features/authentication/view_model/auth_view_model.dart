import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tezda_assessment/core/app_set_up/base_model.dart';
import 'package:tezda_assessment/core/app_set_up/locator.dart';
import 'package:tezda_assessment/dialog_service/dialog_service.dart';
import 'package:tezda_assessment/features/authentication/views/create_password.dart';
import 'package:tezda_assessment/models/data_input_model/data_input_model.dart';
import 'package:tezda_assessment/models/data_input_model/password_validator_model.dart';

final authenticationViewModelProvider =
    ChangeNotifierProvider<AuthViewModel>((ref) {
  return AuthViewModel(ref);
});

class AuthViewModel extends BaseModel {
  AuthViewModel(this.ref);
  final Ref ref;

// Form Inputs
  DataInputModel defaultInput =
      DataInputModel(isNotValid: true, isValid: false, data: "");
  DataInputModel? firstName;
  DataInputModel? lastName;
  DataInputModel? emailAddress;
  DataInputModel? loginEmailAddress;
  DataInputModel? phoneNumber;
  DataInputModel? password;
  String loginPassword = "";
  DataInputModel? confirmPassword;
  PasswordValidatorModel passwordValid = PasswordValidatorModel();

  //Form Inputs manipulators
  onChangeFirstName(DataInputModel input) {
    firstName = input;
    notifyListeners();
  }

  onChangeLastName(DataInputModel input) {
    lastName = input;
    notifyListeners();
  }

  onChangeemailAddress(DataInputModel input) {
    emailAddress = input;
    notifyListeners();
  }

  onChangeLoginEmailAddress(DataInputModel input) {
    loginEmailAddress = input;
    notifyListeners();
  }

  onChangePhoneNumber(String number) {
    phoneNumber =
        DataInputModel(isNotValid: true, isValid: false, data: number);
    notifyListeners();
  }

  onValidatePhoneNumber(bool value) {
    phoneNumber = DataInputModel(
      isNotValid: !value,
      isValid: value,
      data: phoneNumber?.data ?? "",
    );
    notifyListeners();
  }

  onChangePassword(String newpassword) {
    password = DataInputModel(
      isNotValid: true,
      data: newpassword,
      isValid: true,
    );
    passwordValid = PasswordValidatorModel.validatePassword(
      newpassword,
      confirmPassword?.data ?? "",
    );
    confirmPassword = DataInputModel(
      isNotValid: password?.data != confirmPassword?.data,
      data: confirmPassword?.data ?? "",
      isValid: password?.data == confirmPassword?.data,
    );
    notifyListeners();
  }

  onChangeConfirmPassword(String newpassword) {
    confirmPassword = DataInputModel(
      isNotValid: password?.data != newpassword,
      data: newpassword,
      isValid: password?.data == newpassword,
    );
    notifyListeners();
  }

  onChangeLoginPassword(String newpassword) {
    loginPassword = newpassword;
  }

  clearInput() {
    firstName = defaultInput;
    lastName = defaultInput;
    emailAddress = defaultInput;
    phoneNumber = defaultInput;
    password = defaultInput;
    confirmPassword = defaultInput;
    loginPassword = "";
    loginEmailAddress = defaultInput;
  }

  clearPassword() {
    passwordValid = PasswordValidatorModel();
    password = null;
    confirmPassword = null;
  }

// navigation
  continueToCreatePassword() {
    if (firstName?.isValid == true &&
        lastName?.isValid == true &&
        phoneNumber?.isValid == true &&
        emailAddress?.isValid == true) {
      navigator.push(
        routeName: CreatePasswordPage.routeName,
      );
    } else {
      dialogService.showErrorToast(
        message: "Ensure all inputs are valid before you proceed",
      );
    }
  }
}
