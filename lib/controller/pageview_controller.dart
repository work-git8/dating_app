import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/controller/image_controller.dart';
import 'package:dating_app/controller/profile_controller.dart';
import 'package:dating_app/core/global.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class PageviewController extends GetxController{

  final profileController = Get.find<ProfileController>();
  final imageController = Get.find<ImageController>();
  Rx<PageController> pageController = PageController().obs;
  RxInt currentIndex = 0.obs;


  Rx<TextEditingController> nameController = TextEditingController().obs;
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> ageController = TextEditingController().obs;
  Rx<TextEditingController> phoneNoController = TextEditingController().obs;
  Rx<TextEditingController> cityController = TextEditingController().obs;
  Rx<TextEditingController> countryController = TextEditingController().obs;
  Rx<TextEditingController> profileHeadingController = TextEditingController().obs;
  Rx<TextEditingController> lookingForInaPartnerController = TextEditingController().obs;

  Rx<TextEditingController> heightController = TextEditingController().obs;
  Rx<TextEditingController> weightController = TextEditingController().obs;
  Rx<TextEditingController> bodyTypeController = TextEditingController().obs;

  Rx<TextEditingController> drinkController = TextEditingController().obs;
  Rx<TextEditingController> smokeController = TextEditingController().obs;
  Rx<TextEditingController> maritalStatusController = TextEditingController().obs;
  Rx<TextEditingController> haveChildrenController = TextEditingController().obs;
  Rx<TextEditingController> noOfChildrenController = TextEditingController().obs;
  Rx<TextEditingController> livingSituationController = TextEditingController().obs;
  Rx<TextEditingController> willingToRelocateController = TextEditingController().obs;
  Rx<TextEditingController> relationshipYouAreLookingForController = TextEditingController().obs;

  Rx<TextEditingController> nationalityController = TextEditingController().obs;
  Rx<TextEditingController> educationController = TextEditingController().obs;
  Rx<TextEditingController> languageSpokenController = TextEditingController().obs;
  Rx<TextEditingController> religionController = TextEditingController().obs;
  Rx<TextEditingController> ethnicityController = TextEditingController().obs;
  Rx<TextEditingController> professionController = TextEditingController().obs;
  Rx<TextEditingController> employmentStatusController = TextEditingController().obs;
  Rx<TextEditingController> incomeController = TextEditingController().obs;


  saveToFirebase(int index) async{
    if(index == 1){
      profileController.fillName(nameController.value.text);
    }else if(index == 2) {
       imageController.fillImageDetails();
    }
    else if(index == 3){
      profileController.fillPersonalInfoDetails(emailController.value.text, int.parse(ageController.value.text), phoneNoController.value.text, cityController.value.text, countryController.value.text, profileHeadingController.value.text, lookingForInaPartnerController.value.text);
    }else if(index == 4){
      profileController.fillAppearanceDetails(heightController.value.text, weightController.value.text, bodyTypeController.value.text);
    }else if(index == 5){
      profileController.fillLifeStyleDetails(drinkController.value.text, smokeController.value.text, maritalStatusController.value.text, haveChildrenController.value.text, int.parse(noOfChildrenController.value.text), livingSituationController.value.text, willingToRelocateController.value.text, relationshipYouAreLookingForController.value.text);
    };
  }

  retrieveUserInfo() async {
    await FirebaseFirestore.instance.collection("users").doc(currentUserID).get().then((snapshot) {
      if (snapshot.exists) {
         var imageProfile = snapshot["imageProfile"];
      if (imageProfile != null && imageProfile is List) {
        for (var i = 0; i < imageProfile.length && i < 2; i++) {
          String imagePath = imageProfile[i];
          if (imagePath != null && imagePath.isNotEmpty) {
            XFile imageFile = XFile(imagePath);
            imageController.images[i] = imageFile;
            print(imageController.images[i]);
          }
        }
      }
        nameController.value.text = snapshot["name"] != null && snapshot["name"] != '' ? snapshot["name"] : "";
        emailController.value.text = snapshot["email"] != null && snapshot["email"] != '' ? snapshot["email"] : "";
        ageController.value.text = snapshot["age"] != null && snapshot["age"] != '' ? snapshot["age"].toString() : "0";
        phoneNoController.value.text = snapshot["phoneNo"] != null && snapshot["phoneNo"] != '' ? snapshot["phoneNo"] : "";
        cityController.value.text = snapshot["city"] != null && snapshot["city"] != '' ? snapshot["city"] : "";
        countryController.value.text = snapshot["country"] != null && snapshot["country"] != '' ? snapshot["country"] : "";
        profileHeadingController.value.text = snapshot["profileHeading"] != null && snapshot["profileHeading"] != '' ? snapshot["profileHeading"] : "";
        lookingForInaPartnerController.value.text = snapshot["lookingForInAPartner"] != null && snapshot["lookingForInAPartner"] != '' ? snapshot["lookingForInAPartner"] : "";

        //Appearance
        heightController.value.text = snapshot["height"] != null && snapshot["height"] != '' ? snapshot["height"] : "";
        weightController.value.text = snapshot["weight"] != null && snapshot["weight"] != '' ? snapshot["weight"] : "";
        bodyTypeController.value.text = snapshot["bodyType"] != null && snapshot["bodyType"] != '' ? snapshot["bodyType"] : "";

        //Lifestyle & Background
        drinkController.value.text = snapshot["drink"] != null && snapshot["drink"] != '' ? snapshot["drink"] : "";
        smokeController.value.text = snapshot["smoke"] != null && snapshot["smoke"] != '' ? snapshot["smoke"] : "";
        maritalStatusController.value.text = snapshot["maritalStatus"] != null && snapshot["maritalStatus"] != '' ? snapshot["maritalStatus"] : "";
        haveChildrenController.value.text = snapshot["haveChildren"] != null && snapshot["haveChildren"] != '' ? snapshot["haveChildren"] : "";
        noOfChildrenController.value.text = snapshot["noOfChildren"] != null && snapshot["noOfChildren"] != '' ? snapshot["noOfChildren"].toString() : "0";
        professionController.value.text = snapshot["profession"] != null && snapshot["profession"] != '' ? snapshot["profession"] : "";
        employmentStatusController.value.text = snapshot["employmentStatus"] != null && snapshot["employmentStatus"] != '' ? snapshot["employmentStatus"] : "";
        incomeController.value.text = snapshot["income"] != null && snapshot["income"] != '' ? snapshot["income"] : "";
        livingSituationController.value.text = snapshot["livingSituation"] != null && snapshot["livingSituation"] != '' ? snapshot["livingSituation"] : "";
        willingToRelocateController.value.text = snapshot["willingToRelocate"] != null && snapshot["willingToRelocate"] != '' ? snapshot["willingToRelocate"] : "";
        relationshipYouAreLookingForController.value.text = snapshot["relationshipYouAreLookingFor"] != null && snapshot["relationshipYouAreLookingFor"] != '' ? snapshot["relationshipYouAreLookingFor"] : "";
        nationalityController.value.text = snapshot["nationality"] != null && snapshot["nationality"] != '' ? snapshot["nationality"] : "";
        educationController.value.text = snapshot["education"] != null && snapshot["education"] != '' ? snapshot["education"] : "";
        languageSpokenController.value.text = snapshot["languageSpoken"] != null && snapshot["languageSpoken"] != '' ? snapshot["languageSpoken"] : "";
        religionController.value.text = snapshot["religion"] != null && snapshot["religion"] != '' ? snapshot["religion"] : "";
        ethnicityController.value.text = snapshot["ethnicity"] != null && snapshot["ethnicity"] != '' ? snapshot["ethnicity"] : "";
 
      }
    });
  }

  @override
  void onInit() {
    super.onInit;
    
    retrieveUserInfo();
  }

  @override
  void onClose() {
          nameController.value.dispose() ;
          emailController.value.dispose();
          ageController.value.dispose();
          phoneNoController.value.dispose();
          cityController.value.dispose();
          countryController.value.dispose();
          profileHeadingController.value.dispose();
          lookingForInaPartnerController.value.dispose();

          //Appearance
          heightController.value.dispose();
          weightController.value.dispose();
          bodyTypeController.value.dispose();

          //Lifestyle & Background
          drinkController.value.dispose();
          smokeController.value.dispose();
          maritalStatusController.value.dispose();
          haveChildrenController.value.dispose();
          noOfChildrenController.value.dispose();
          professionController.value.dispose();
          employmentStatusController.value.dispose();
          incomeController.value.dispose();
          livingSituationController.value.dispose();
          willingToRelocateController.value.dispose();
          relationshipYouAreLookingForController.value.dispose();
          nationalityController.value.dispose();
          educationController.value.dispose();
          languageSpokenController.value.dispose();
          religionController.value.dispose();
          ethnicityController.value.dispose();

    super.onClose();
  }

}