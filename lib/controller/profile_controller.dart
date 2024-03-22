import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:dating_app/homeScreen/home_screen.dart';
import 'package:dating_app/mobile_number_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/person.dart';

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
    String? name,
    String? email,
    int? age,
    String? phoneNo,
    String? city,
    String? country,
    String? profileHeading,
    String? lookingForInAPartner,

    //Appearance
    String? height,
    String? weight,
    String? bodyType,

    //LifeStyle
    String? drink,
    String? smoke,
    String? maritalStatus,
    String? haveChildren,
    int? noOfChildren,
    String? profession,
    String? employmentStatus,
    String? income,
    String? livingSituation,
    String? willingToRelocate,
    String? relationshipYouAreLookingFor,

    //Background-Cultural Values
    String? nationality,
    String? education,
    String? languageSpoken,
    String? religion,
    String? ethnicity) async
    {
        try {
          Person personInstance = Person(
            email :email,
            age:age,
            phoneNo:phoneNo,
            city:city,
            country:country,
            profileHeading:profileHeading,
            lookingForInAPartner:lookingForInAPartner,
            publishedDateTime:DateTime.now().millisecondsSinceEpoch,

            //Appearance
            height:height,
            weight:weight,
            bodyType:bodyType,

            //LifeStyle
            drink:drink,
            smoke:smoke,
            maritalStatus:maritalStatus,
            haveChildren:haveChildren,
            noOfChildren:noOfChildren,
            profession:profession,
            employmentStatus:employmentStatus,
            income:income,
            livingSituation:livingSituation,
            willingToRelocate:willingToRelocate,
            relationshipYouAreLookingFor:relationshipYouAreLookingFor,

            //Background-Cultural Values
            nationality:nationality,
            education:education,
            languageSpoken:languageSpoken,
            religion:religion,
            ethnicity:ethnicity
          );

          await FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).set(personInstance.toJson());
        } catch (e) {
          Get.snackbar("Account creation Unsuccessful", "Error message: $e", snackPosition: SnackPosition.BOTTOM, colorText: Colors.red.shade900);
        }
    }


    fillPersonalInfoDetails(
    String? name,
    String? email,
    int? age,
    String? phoneNo,
    String? city,
    String? country,
    String? profileHeading,
    String? lookingForInAPartner,) async {
      try {
          Person personInstance = Person(
            email :email,
            age:age,
            phoneNo:phoneNo,
            city:city,
            country:country,
            profileHeading:profileHeading,
            lookingForInAPartner:lookingForInAPartner,
            publishedDateTime:DateTime.now().millisecondsSinceEpoch,);
             await FirebaseFirestore.instance.collection("users").doc(currentUserID).set(personInstance.toJson());
        } catch (e) {
          Get.snackbar("Account creation Unsuccessful", "Error message: $e", snackPosition: SnackPosition.BOTTOM, colorText: Colors.red.shade900);
        }
    }
    
  

  checkIfUserIsLoggedIn(User? currentUser){
    if(currentUser == null){
      Get.to(()=>MobileNumberScreen());
    }else{
      Get.to(()=>HomeScreen());
    }

    @override
    void onReady(){
      super.onReady();

      firebaseCurrentUser = Rx<User?>(FirebaseAuth.instance.currentUser);
      firebaseCurrentUser.bindStream(FirebaseAuth.instance.authStateChanges());

      ever(firebaseCurrentUser, checkIfUserIsLoggedIn);
    }

  }

  favoriteSentFavoriteReceived(String toUserID, String senderName) async {

    var document = await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("favoriteReceived").doc(currentUserID).get();

    if(document.exists){
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("favoriteReceived").doc(currentUserID).delete();

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("favoriteSent").doc(toUserID).delete();
    }else{
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("favoriteReceived").doc(currentUserID).set({});

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("favoriteSent").doc(toUserID).set({});
    }

    update();
  }

    likeSentLikeReceived(String toUserID, String senderName) async {

    var document = await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("likeReceived").doc(currentUserID).get();

    if(document.exists){
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("likeReceived").doc(currentUserID).delete();

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("likeSent").doc(toUserID).delete();
    }else{
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("likeReceived").doc(currentUserID).set({});

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("likeSent").doc(toUserID).set({});
    }

    update();
  }

    viewSentViewReceived(String toUserID, String senderName) async {

    var document = await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("viewReceived").doc(currentUserID).get();

    if(document.exists){
      print("Already in view list");
    }else{
      await FirebaseFirestore.instance.collection("users").doc(toUserID).collection("viewReceived").doc(currentUserID).set({});

      await FirebaseFirestore.instance.collection("users").doc(currentUserID).collection("viewSent").doc(toUserID).set({});
    }

    update();
  }
}
