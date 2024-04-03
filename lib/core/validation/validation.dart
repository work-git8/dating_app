import 'regex.dart';
import 'validation_messages.dart';

class Validation{
  static String emailAndPhoneValidator(String? input) {
  if (input == null || input.isEmpty) {
    return ValidationMessage.emptyValidateMessage; // Return error message if input is empty
  }

  // Check if input matches either email or mobile number pattern
  if (Regex.emailPattern.hasMatch(input) || Regex.mobilePattern.hasMatch(input)) {
    return ''; // Return null if input is valid
  }
  return ValidationMessage.emailOrMobileValidateMessage;
}

  static String emailValidator(String? input) {
  if (input == null || input.isEmpty) {
    return ValidationMessage.emptyValidateMessage; // Return error message if input is empty
  }

  // Check if input matches either email or mobile number pattern
  if (Regex.emailPattern.hasMatch(input)) {
    return ''; // Return null if input is valid
  }
  return ValidationMessage.emailValidateMessage;
}

  static String PhoneValidator(String? input) {
  if (input == null || input.isEmpty) {
    return ValidationMessage.emptyValidateMessage; // Return error message if input is empty
  }

  // Check if input matches either email or mobile number pattern
  if (Regex.mobilePattern.hasMatch(input)) {
    return ''; // Return null if input is valid
  }
  return ValidationMessage.mobileValidateMessage;
}


  static String passwordValidator(String? value){
    if (value == null || value.isEmpty) {
    return ValidationMessage.emptyValidateMessage; // Return error message if input is empty
  }
    
    if(Regex.passPattern.hasMatch(value)){
       return '';
  }
   else{
    return ValidationMessage.passwordValidateMessage;
  }
}


  static String emptyFieldValidator(String? value){
    if (value == null || value.isEmpty) {
    return ValidationMessage.emptyValidateMessage; // Return error message if input is empty
  }
   else{
    return '';
  }
}
}