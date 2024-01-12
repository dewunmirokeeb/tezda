class InputValidators {
  static bool validateEmail(String email) {
    // Regular expression pattern for email validation
    const pattern = r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,}$';
    // Create a RegExp object with the pattern
    final regex = RegExp(pattern);
    // Use the RegExp object's hasMatch() method to check if the email matches the pattern
    return regex.hasMatch(email);
  }

  static bool validatePassword(String password) {
    // Regular expression pattern for password validation
    const pattern = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';

    // Create a RegExp object with the pattern
    final regex = RegExp(pattern);

    // Use the RegExp object's hasMatch() method to check if the password matches the pattern
    return regex.hasMatch(password);
  }

  static bool validateName(String name) {
    return name.length > 3;
  }

  static bool validatePhoneNumber(String phoneNumber) {
    const pattern = r'^\+\d{1,3}[-. ]?\(?\d{1,3}\)?[-. ]?\d{1,4}[-. ]?\d{1,4}$';
    final regex = RegExp(pattern);
    return regex.hasMatch(phoneNumber);
  }
}
