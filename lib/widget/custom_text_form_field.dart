import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final AutovalidateMode? autovalidate;
  final TextEditingController controller;
  final String hintText;
  final String? Function(String?)? validator;
  final Widget? icon;
  final Widget? suffixIcon;
  final bool isObscureText;
  final TextInputType? inputType;

  const CustomTextFormField(
      {super.key,
      this.autovalidate,
      required this.controller,
      required this.hintText,
      this.validator,
      this.icon,
      this.suffixIcon,
      this.isObscureText = false,
      this.inputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: autovalidate,
      validator: validator,
      controller: controller,
      obscureText: isObscureText,
      keyboardType: inputType,
      decoration: InputDecoration(
        prefixIcon: icon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
