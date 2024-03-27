
import 'dart:ffi';

import 'package:dating_app/lifestyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/appearance_controller.dart';
import 'widget/custom_text_form_field.dart';

class AppearanceDetails extends StatefulWidget {
  const AppearanceDetails({super.key});

  @override
  State<AppearanceDetails> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<AppearanceDetails> {

  final appearanceController = Get.put(AppearanceController());

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
                    text: 'Your Appearance',
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
            SizedBox(width: MediaQuery.of(context).size.width-36,child: CustomTextFormField(controller: appearanceController.heightController.value, hintText:"Enter your Height in ft", icon: Icon(Icons.insert_chart),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: appearanceController.weightController.value, hintText: "Enter your Weight in kgs", icon: Icon(Icons.table_chart))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: appearanceController.bodyTypeController.value, hintText: "Enter your Body Type", icon:Icon(Icons.type_specimen_sharp))),
            SizedBox(height: 410),
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
                    Get.to(() => LifeStyleDetails(), arguments: '');
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