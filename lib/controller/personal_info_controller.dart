import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoController extends GetxController{
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  Rx<TextEditingController> phoneNoController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> profileHeadingController = TextEditingController().obs;
  Rx<TextEditingController> lookingForInaPartnerController = TextEditingController().obs;
}