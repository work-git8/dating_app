class Regex{
  static RegExp emailPattern = RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b');
  //static RegExp mobilePattern = RegExp(r'^\d{7,12}$');
  static RegExp mobilePattern = RegExp(r'^\+\d{12}$');
  static RegExp passPattern = RegExp(r'^(?=.*\d)(?=.*[!@#$%^&])(?=.*[a-z])(?=.*[A-Z]).{8,}$');
}