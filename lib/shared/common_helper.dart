import 'package:we_help_app/shared/shared.dart';

class CommonHelper {
  CommonHelper._();

  static String? emailValidator(String? email) {
    if (email == null) {
      return "Email is required.";
    }
    if (!email.isValidEmail()) {
      return "Email is not valid.";
    }
    return null;
  }

  static String? passwordValidator(String? password) {
    if (password == null) {
      return "Password is required.";
    }
    if (password.length < 6) {
      return "Password has minimum of 6 characters.";
    }
    return null;
  }
}
