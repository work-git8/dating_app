import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackgroundDetailsController extends GetxController{
  Rx<TextEditingController> nationalityController = TextEditingController().obs;
  Rx<TextEditingController> educationController = TextEditingController().obs;
  Rx<TextEditingController> languageSpokenController = TextEditingController().obs;
  Rx<TextEditingController> religionController = TextEditingController().obs;
  Rx<TextEditingController> ethnicityController = TextEditingController().obs;
  Rx<TextEditingController> professionController = TextEditingController().obs;
  Rx<TextEditingController> employmentStatusController = TextEditingController().obs;
  Rx<TextEditingController> incomeController = TextEditingController().obs;
}