
import 'dart:ffi';

import 'package:dating_app/controller/pageview_controller.dart';
import 'package:dating_app/views/profile/lifestyle.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/appearance_controller.dart';
import '../../widget/custom_text_form_field.dart';

class AppearanceDetails extends StatefulWidget {
  const AppearanceDetails({super.key});

  @override
  State<AppearanceDetails> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<AppearanceDetails> {

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
            SizedBox(width: MediaQuery.of(context).size.width-36,child: CustomTextFormField(controller: pageviewController.heightController.value, hintText:"Enter your Height in ft", icon: Icon(Icons.insert_chart),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.weightController.value, hintText: "Enter your Weight in kgs", icon: Icon(Icons.table_chart))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.bodyTypeController.value, hintText: "Enter your Body Type", icon:Icon(Icons.type_specimen_sharp))),
          ],
        ),
      ),
    );
  }
}