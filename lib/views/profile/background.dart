import 'package:dating_app/controller/pageview_controller.dart';
import 'package:dating_app/views/profile/appearance.dart';
import 'package:dating_app/controller/personal_info_controller.dart';
import 'package:dating_app/views/homeScreen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../controller/background_details_controller.dart';
import '../../widget/custom_text_form_field.dart';

class BackgroundDetails extends StatefulWidget {
  const BackgroundDetails({super.key});

  @override
  State<BackgroundDetails> createState() => _BackgroundDetailsState();
}

class _BackgroundDetailsState extends State<BackgroundDetails> {

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
                    text: 'Background Details',
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
            SizedBox(width: MediaQuery.of(context).size.width-36,child: CustomTextFormField(controller: pageviewController.nationalityController.value, hintText:"Nationality", icon: Icon(Icons.flag),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.educationController.value, hintText: "Educaton", icon: Icon(Icons.history_edu))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.languageSpokenController.value, hintText: "Language Spoken", icon: Icon(CupertinoIcons.person_badge_plus_fill))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.religionController.value, hintText: "Religion", icon:Icon(CupertinoIcons.checkmark_seal_fill))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.ethnicityController.value, hintText: "Ethnicity", icon:Icon(CupertinoIcons.eye),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.professionController.value, hintText: "Profession", icon: Icon(Icons.business_center))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.employmentStatusController.value, hintText: "Employment Status", icon: Icon(CupertinoIcons.rectangle_stack_person_crop_fill))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.incomeController.value, hintText: "Income", icon:Icon(CupertinoIcons.money_dollar_circle))), 
          ],
        ),
      ),
    );
  }
}