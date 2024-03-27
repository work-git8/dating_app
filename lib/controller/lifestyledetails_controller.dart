import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LifeStyleDetailsController extends GetxController{
  Rx<TextEditingController> drinkController = TextEditingController().obs;
  Rx<TextEditingController> smokeController = TextEditingController().obs;
  Rx<TextEditingController> maritalStatusController = TextEditingController().obs;
  Rx<TextEditingController> haveChildrenController = TextEditingController().obs;
  Rx<TextEditingController> noOfChildrenController = TextEditingController().obs;
  Rx<TextEditingController> livingSituationController = TextEditingController().obs;
  Rx<TextEditingController> willingToRelocateController = TextEditingController().obs;
  Rx<TextEditingController> relationshipYouAreLookingForController = TextEditingController().obs;
}