import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/core/global.dart';
import 'package:dating_app/views/auth/second_screen.dart';
import 'package:dating_app/views/homeScreen/home_screen.dart';
import 'package:dating_app/views/auth/mobile_number_screen.dart';
import 'package:dating_app/views/location/location_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/models/person.dart';

class ProfileController extends GetxController {
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);

  List<Person> get allUsersProfileList => usersProfileList.value;

  late Rx<User?> firebaseCurrentUser;

  @override
  void onInit() {
    super.onInit();

    usersProfileList.bindStream(FirebaseFirestore.instance
        .collection("users")
        .where("uid", isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .snapshots()
        .map((QuerySnapshot queryDataSnapshot) {
      List<Person> profilesList = [];

      for (var eachProfile in queryDataSnapshot.docs) {
        profilesList.add(Person.fromDataSnapshot(eachProfile));
      }
      return profilesList;
    }));
  }

  createNewUserAccount(
      // String? name,
      // String? email,
      // int? age,
      // String? phoneNo,
      // String? city,
      // String? country,
      // String? profileHeading,
      // String? lookingForInAPartner,

      // //Appearance
      // String? height,
      // String? weight,
      // String? bodyType,

      // //LifeStyle
      // String? drink,
      // String? smoke,
      // String? maritalStatus,
      // String? haveChildren,
      // int? noOfChildren,
      // String? profession,
      // String? employmentStatus,
      // String? income,
      // String? livingSituation,
      // String? willingToRelocate,
      // String? relationshipYouAreLookingFor,

      // //Background-Cultural Values
      // String? nationality,
      // String? education,
      // String? languageSpoken,
      // String? religion,
      // String? ethnicity
      ) async {
    try {
      Person personInstance = Person(
          // email: email,
          // age: age,
          // phoneNo: phoneNo,
          // city: city,
          // country: country,
          // profileHeading: profileHeading,
          // lookingForInAPartner: lookingForInAPartner,
          // publishedDateTime: DateTime.now().millisecondsSinceEpoch,

          // //Appearance
          // height: height,
          // weight: weight,
          // bodyType: bodyType,

          // //LifeStyle
          // drink: drink,
          // smoke: smoke,
          // maritalStatus: maritalStatus,
          // haveChildren: haveChildren,
          // noOfChildren: noOfChildren,
          // profession: profession,
          // employmentStatus: employmentStatus,
          // income: income,
          // livingSituation: livingSituation,
          // willingToRelocate: willingToRelocate,
          // relationshipYouAreLookingFor: relationshipYouAreLookingFor,

          // //Background-Cultural Values
          // nationality: nationality,
          // education: education,
          // languageSpoken: languageSpoken,
          // religion: religion,
          // ethnicity: ethnicity
          );

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).set(personInstance.toJson());
    } catch (e) {
      Get.snackbar("Account creation Unsuccessful", "Error message: $e", snackPosition: SnackPosition.BOTTOM, colorText: Colors.red.shade900);
    }
    update();
  }

  fillName( String? name ) async {
   try {
    await FirebaseFirestore.instance.collection("users").doc(currentUserID).update({
      "name" : name});
   } catch (e) {
     Get.snackbar("Update Unsuccessful", "Error message: $e", snackPosition: SnackPosition.BOTTOM, colorText: Colors.red.shade900);
   }
   update();
  }

  fillPersonalInfoDetails(
    String? email,
    int? age,
    String? phoneNo,
    String? city,
    String? country,
    String? profileHeading,
    String? lookingForInAPartner,
  ) async {
    try {
      // Person personInstance = Person(
      //   name: name,
      //   email: email,
      //   age: age,
      //   phoneNo: phoneNo,
      //   city: city,
      //   country: country,
      //   profileHeading: profileHeading,
      //   lookingForInAPartner: lookingForInAPartner,
      //   publishedDateTime: DateTime.now().millisecondsSinceEpoch,
      // );
      await FirebaseFirestore.instance.collection("users").doc(currentUserID).update({
        "email": email,
        "age": age,
        "phoneNo": phoneNo,
        "city": city,
        "country": country,
        "profileHeading": profileHeading,
        "lookingForInAPartner": lookingForInAPartner,
        "publishedDateTime": DateTime.now().millisecondsSinceEpoch,
      });
    } catch (e) {
      Get.snackbar("Update Unsuccessful", "Error message: $e", snackPosition: SnackPosition.BOTTOM, colorText: Colors.red.shade900);
    }
    update();
  }

  fillAppearanceDetails(
    String? height,
    String? weight,
    String? bodyType,
  ) async {
    try {
      // Person personInstance = Person(
      //   height: height,
      //   weight: weight,
      //   bodyType: bodyType,
      // );
      await FirebaseFirestore.instance.collection("users").doc(currentUserID).update(
        {
          "height":height,
          "weight":weight,
          "bodyType":bodyType,
        }
      );
    } catch (e) {
      Get.snackbar("Update Unsuccessful", "Error message: $e", snackPosition: SnackPosition.BOTTOM, colorText: Colors.red.shade900);
    }
    update();
  }

  fillLifeStyleDetails(
    String? drink,
    String? smoke,
    String? maritalStatus,
    String? haveChildren,
    int? noOfChildren,
    String? livingSituation,
    String? willingToRelocate,
    String? relationshipYouAreLookingFor,
  ) async {
    try {
      // Person personInstance = Person(
      //   drink: drink,
      //   smoke: smoke,
      //   maritalStatus: maritalStatus,
      //   haveChildren: haveChildren,
      //   noOfChildren: noOfChildren,
      //   livingSituation: livingSituation,
      //   willingToRelocate: willingToRelocate,
      //   relationshipYouAreLookingFor: relationshipYouAreLookingFor,
      // );
      await FirebaseFirestore.instance.collection("users").doc(currentUserID).update({
        "drink":drink,
        "smoke":smoke,
        "maritalStatus":maritalStatus,
        "haveChildren":haveChildren,
        "noOfChildren":noOfChildren,
        "livingSituation":livingSituation,
        "willingToRelocate":willingToRelocate,
        "relationshipYouAreLookingFor":relationshipYouAreLookingFor,
      });
    } catch (e) {
      Get.snackbar("Update Unsuccessful", "Error message: $e", snackPosition: SnackPosition.BOTTOM, colorText: Colors.red.shade900);
    }
    update();
  }

  fillBackgroundDetails(String? profession, String? employmentStatus, String? income, String? nationality, String? education, String? languageSpoken,
      String? religion, String? ethnicity) async {
    try {
      // Person personInstance = Person(
      //     profession: profession,
      //     employmentStatus: employmentStatus,
      //     income: income,
      //     nationality: nationality,
      //     education: education,
      //     languageSpoken: languageSpoken,
      //     religion: religion,
      //     ethnicity: ethnicity);
      await FirebaseFirestore.instance.collection("users").doc(currentUserID).update({
        "nationality":nationality,
        "education":education,
        "languageSpoken":languageSpoken,
        "religion":religion,
        "ethnicity":ethnicity,
        "profession":profession,
        "employmentStatus":employmentStatus,
        "income":income,
        });
    } catch (e) {
      Get.snackbar("Update Unsuccessful", "Error message: $e", snackPosition: SnackPosition.BOTTOM, colorText: Colors.red.shade900);
    }
    update();
  }

  checkIfUserIsLoggedIn(User? currentUser) {
    if (currentUser == null) {
      Get.to(() => SecondScreen());
    } else {
      Get.to(() => LocationScreen());
    }

    @override
    void onReady() {
      super.onReady();

      firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
      firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());

      ever(firebaseCurrentUser, checkIfUserIsLoggedIn);
    }
  }

  favoriteSentFavoriteReceived(String toUserID, String senderName) async {
    var document = await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("favoriteReceived").doc(currentUserID).get();

    if (document.exists) {
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("favoriteReceived").doc(currentUserID).delete();

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("favoriteSent").doc(toUserID).delete();
    } else {
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("favoriteReceived").doc(currentUserID).set({});

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("favoriteSent").doc(toUserID).set({});
    }

    update();
  }

  likeSentLikeReceived(String toUserID, String senderName) async {
    var document = await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("likeReceived").doc(currentUserID).get();

    if (document.exists) {
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("likeReceived").doc(currentUserID).delete();

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("likeSent").doc(toUserID).delete();
    } else {
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("likeReceived").doc(currentUserID).set({});

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("likeSent").doc(toUserID).set({});
    }

    update();
  }

  viewSentViewReceived(String toUserID, String senderName) async {
    var document = await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("viewReceived").doc(currentUserID).get();

    if (document.exists) {
      print("Already in view list");
    } else {
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("viewReceived").doc(currentUserID).set({});

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("viewSent").doc(toUserID).set({});
    }

    update();
  }
}
