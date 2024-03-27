import 'package:dating_app/appearance.dart';
import 'package:dating_app/controller/personal_info_controller.dart';
import 'package:dating_app/homeScreen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controller/background_details_controller.dart';
import 'widget/custom_text_form_field.dart';

class BackgroundDetails extends StatefulWidget {
  const BackgroundDetails({super.key});

  @override
  State<BackgroundDetails> createState() => _BackgroundDetailsState();
}

class _BackgroundDetailsState extends State<BackgroundDetails> {

  final backgroundDetailsController = Get.put(BackgroundDetailsController());

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
            SizedBox(width: MediaQuery.of(context).size.width-36,child: CustomTextFormField(controller: backgroundDetailsController.nationalityController.value, hintText:"Nationality", icon: Icon(Icons.flag),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: backgroundDetailsController.educationController.value, hintText: "Educaton", icon: Icon(Icons.history_edu))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: backgroundDetailsController.languageSpokenController.value, hintText: "Language Spoken", icon: Icon(CupertinoIcons.person_badge_plus_fill))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: backgroundDetailsController.religionController.value, hintText: "Religion", icon:Icon(CupertinoIcons.checkmark_seal_fill))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: backgroundDetailsController.ethnicityController.value, hintText: "Ethnicity", icon:Icon(CupertinoIcons.eye),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: backgroundDetailsController.professionController.value, hintText: "Profession", icon: Icon(Icons.business_center))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: backgroundDetailsController.employmentStatusController.value, hintText: "Employment Status", icon: Icon(CupertinoIcons.rectangle_stack_person_crop_fill))),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: backgroundDetailsController.incomeController.value, hintText: "Income", icon:Icon(CupertinoIcons.money_dollar_circle))),
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
                    Get.to(() => HomeScreen(), arguments: '');
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