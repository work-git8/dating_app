import 'package:dating_app/appearance.dart';
import 'package:dating_app/background.dart';
import 'package:dating_app/controller/personal_info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/lifestyledetails_controller.dart';
import 'widget/custom_text_form_field.dart';

class LifeStyleDetails extends StatefulWidget {
  const LifeStyleDetails({super.key});

  @override
  State<LifeStyleDetails> createState() => _LifeStyleDetailsState();
}

class _LifeStyleDetailsState extends State<LifeStyleDetails> {

  final lifeStyleDetailsController = Get.put(LifeStyleDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 80),
            RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: 'LifeStyle Details',
                    style: GoogleFonts.pacifico(
                      fontSize: 40,
                      color: Colors.red,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),
            SizedBox(width: MediaQuery.of(context).size.width-36,child: CustomTextFormField(controller: lifeStyleDetailsController.drinkController.value, hintText:"About your drinking habit", icon: Icon(Icons.local_drink_outlined),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: lifeStyleDetailsController.smokeController.value, hintText: "About your smoking habit", icon: Icon(Icons.smoking_rooms))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: lifeStyleDetailsController.maritalStatusController.value, hintText: "Marital Status", icon: Icon(Icons.person_2_outlined))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: lifeStyleDetailsController.haveChildrenController.value, hintText: "Do you have children?", icon: Icon(Icons.person_3_rounded))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: lifeStyleDetailsController.noOfChildrenController.value, hintText: "Numbber of children", icon: Icon(Icons.person_4_outlined))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: lifeStyleDetailsController.livingSituationController.value, hintText: "Living Situation", icon: Icon(CupertinoIcons.person_2_square_stack))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: lifeStyleDetailsController.willingToRelocateController.value, hintText: "Are you willing to relocate to another place?", icon: Icon(Icons.person_2))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: lifeStyleDetailsController.relationshipYouAreLookingForController.value, hintText: "What relationship are you looking for in a partner?", icon:Icon(Icons.person_add))),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        color: Colors.black,
                        splashColor: Colors.amber,
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(Icons.arrow_back_ios_new_rounded)),
                Icon(Icons.visibility),
                Text(
                  "This will be shown in your profile",
                  softWrap: true,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Caveat',
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Get.to(() => BackgroundDetails(), arguments: '');
                  },
                  color: Colors.black,
                  splashColor: Colors.amber,
                  style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  icon: Icon(Icons.arrow_forward_ios_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}