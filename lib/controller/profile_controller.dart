import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/global.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/person.dart';

class ProfileController extends GetxController {
  final Rx<List<Person>> usersProfileList = Rx<List<Person>>([]);

  List<Person> get allUsersProfileList => usersProfileList.value;

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
