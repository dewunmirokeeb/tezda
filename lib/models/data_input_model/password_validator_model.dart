class PasswordValidatorModel {
  bool isValidPassword = false;
  bool hasUpperCase = false;
  bool hasLowerCase = false;
  bool hasNumber = false;
  bool hasSpecialCharacter = false;
  bool isMinimum8CharTrue = false;

  PasswordValidatorModel({
    this.isValidPassword = false,
    this.hasLowerCase = false,
    this.hasNumber = false,
    this.hasSpecialCharacter = false,
    this.hasUpperCase = false,
    this.isMinimum8CharTrue = false,
  });

  PasswordValidatorModel.validatePassword(
      String password, String confirmPassword) {
    isMinimum8CharTrue = password.length >= 8;
    hasSpecialCharacter = RegExp(r'[!@#\$%^&*(),.?"={}|<>]').hasMatch(password);
    hasNumber = RegExp(r'\d').hasMatch(password);
    hasUpperCase = RegExp(r'[A-Z]').hasMatch(password);
    hasLowerCase = RegExp(r'[a-z]').hasMatch(password);
    isValidPassword = isMinimum8CharTrue &&
        hasNumber &&
        hasLowerCase &&
        hasSpecialCharacter &&
        hasUpperCase &&
        password == confirmPassword;
  }

  @override
  String toString() {
    Map<String, dynamic> returnedData = {
      "isMinimum8CharTrue": isMinimum8CharTrue,
      "hasSpecialCharacter": hasSpecialCharacter,
      "hasNumber": hasNumber,
      "hasUpperCase": hasUpperCase,
      "hasLowerCase": hasLowerCase,
      "isValidPassword": isValidPassword,
    };
    return returnedData.toString();
  }
}
