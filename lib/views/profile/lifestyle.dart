import 'package:dating_app/controller/pageview_controller.dart';
import 'package:dating_app/views/profile/appearance.dart';
import 'package:dating_app/views/profile/background.dart';
import 'package:dating_app/controller/personal_info_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/lifestyledetails_controller.dart';
import '../../widget/custom_text_form_field.dart';

class LifeStyleDetails extends StatefulWidget {
  const LifeStyleDetails({super.key});

  @override
  State<LifeStyleDetails> createState() => _LifeStyleDetailsState();
}

class _LifeStyleDetailsState extends State<LifeStyleDetails> {

  final pageviewController = Get.find<PageviewController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: SingleChildScrollView(
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
            SizedBox(width: MediaQuery.of(context).size.width-36,child: CustomTextFormField(controller: pageviewController.drinkController.value, hintText:"About your drinking habit", icon: Icon(Icons.local_drink_outlined),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.smokeController.value, hintText: "About your smoking habit", icon: Icon(Icons.smoking_rooms))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.maritalStatusController.value, hintText: "Marital Status", icon: Icon(Icons.person_2_outlined))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.haveChildrenController.value, hintText: "Do you have children?", icon: Icon(Icons.person_3_rounded))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.noOfChildrenController.value, hintText: "Numbber of children", icon: Icon(Icons.person_4_outlined))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.livingSituationController.value, hintText: "Living Situation", icon: Icon(CupertinoIcons.person_2_square_stack))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.willingToRelocateController.value, hintText: "Are you willing to relocate to another place?", icon: Icon(Icons.person_2))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.relationshipYouAreLookingForController.value, hintText: "What relationship are you looking for in a partner?", icon:Icon(Icons.person_add))),
          ],
        ),
      ),
    );
  }
}