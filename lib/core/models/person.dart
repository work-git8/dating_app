
import 'package:cloud_firestore/cloud_firestore.dart';

class Person {
  String? uid;
  List<String>? imageProfile;
  String? name;
  String? email;
  int? age;
  String? phoneNo;
  String? city;
  String? country;
  String? profileHeading;
  String? lookingForInAPartner;
  int? publishedDateTime;

  //Appearance
  String? height;
  String? weight;
  String? bodyType;

  //LifeStyle
  String? drink;
  String? smoke;
  String? maritalStatus;
  String? haveChildren;
  int? noOfChildren;
  String? profession;
  String? employmentStatus;
  String? income;
  String? livingSituation;
  String? willingToRelocate;
  String? relationshipYouAreLookingFor;

  //Background-Cultural Values
  String? nationality;
  String? education;
  String? languageSpoken;
  String? religion;
  String? ethnicity;

  Person({
    this.uid,
    this.imageProfile,
    this.name,
    this.email,
    this.age,
    this.phoneNo,
    this.city,
    this.country,
    this.profileHeading,
    this.lookingForInAPartner,
    this.publishedDateTime,

    //Appearance
    this.height,
    this.weight,
    this.bodyType,

    //LifeStyle
    this.drink,
    this.smoke,
    this.maritalStatus,
    this.haveChildren,
    this.noOfChildren,
    this.profession,
    this.employmentStatus,
    this.income,
    this.livingSituation,
    this.willingToRelocate,
    this.relationshipYouAreLookingFor,

    //Background-Cultural Values
    this.nationality,
    this.education,
    this.languageSpoken,
    this.religion,
    this.ethnicity,
  });

  static Person fromDataSnapshot(DocumentSnapshot snapshot) {
    var dataSnapshot = snapshot.data() as Map<String, dynamic>;

    return Person(
        uid: dataSnapshot['uid'],
        imageProfile: List<String>.from(dataSnapshot['imageProfile'] ?? []),
        name: dataSnapshot['name'],
        email: dataSnapshot['email'],
        age: dataSnapshot['age'],
        phoneNo: dataSnapshot['phoneNo'],
        city: dataSnapshot['city'],
        country: dataSnapshot['country'],
        profileHeading: dataSnapshot['profileHeading'],
        lookingForInAPartner: dataSnapshot['lookingForInaPartner'],
        publishedDateTime: dataSnapshot['publishedDateTime'],

        //Appearance
        height: dataSnapshot['height'],
        weight: dataSnapshot['weight'],
        bodyType: dataSnapshot['bodyType'],

        //LifeStyle
        drink: dataSnapshot['drink'],
        smoke: dataSnapshot['smoke'],
        maritalStatus: dataSnapshot['maritalStatus'],
        haveChildren: dataSnapshot['haveChildren'],
        noOfChildren: dataSnapshot['noOfChildren'],
        profession: dataSnapshot['profession'],
        employmentStatus: dataSnapshot['employmentStatus'],
        income: dataSnapshot['income'],
        livingSituation: dataSnapshot['livingSituation'],
        willingToRelocate: dataSnapshot['willingToRelocate'],
        relationshipYouAreLookingFor:
            dataSnapshot['relationshipYouAreLookingFor'],

        //Background-Cultural Values
        nationality: dataSnapshot['nationality'],
        education: dataSnapshot['education'],
        languageSpoken: dataSnapshot['languageSpoken'],
        religion: dataSnapshot['religion'],
        ethnicity: dataSnapshot['ethnicity']);
  }

  Map<String, dynamic> toJson() => {

    //Personal Info
    "uid": uid,
    "imageProfile": imageProfile,
    "name": name,
     "email" :email,
      "age":age,
      "phoneNo":phoneNo,
      "city":city,
      "country":country,
      "profileHeading":profileHeading,
      "lookingForInAPartner":lookingForInAPartner,
      "publishedDateTime":publishedDateTime,

      //Appearance
      "height":height,
      "weight":weight,
      "bodyType":bodyType,

      //LifeStyle
      "drink":drink,
      "smoke":smoke,
      "maritalStatus":maritalStatus,
      "haveChildren":haveChildren,
      "noOfChildren":noOfChildren,
      "profession":profession,
      "employmentStatus":employmentStatus,
      "income":income,
      "livingSituation":livingSituation,
      "willingToRelocate":willingToRelocate,
      "relationshipYouAreLookingFor":relationshipYouAreLookingFor,

      //Background-Cultural Values
      "nationality":nationality,
      "education":education,
      "languageSpoken":languageSpoken,
      "religion":religion,
      "ethnicity":ethnicity
  };
}
