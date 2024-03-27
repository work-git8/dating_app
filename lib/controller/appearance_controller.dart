import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppearanceController extends GetxController {
  Rx<TextEditingController> heightController = TextEditingController().obs;
  Rx<TextEditingController> weightController = TextEditingController().obs;
  Rx<TextEditingController> bodyTypeController = TextEditingController().obs;
}
