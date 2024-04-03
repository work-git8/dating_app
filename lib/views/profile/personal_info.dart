import 'package:dating_app/controller/pageview_controller.dart';
import 'package:dating_app/views/profile/appearance.dart';
import 'package:dating_app/controller/personal_info_controller.dart';
import 'package:dating_app/core/validation/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/custom_text_form_field.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  var pageviewController = Get.find<PageviewController>();

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
                    text: 'Personal Info',
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
            SizedBox(width: MediaQuery.of(context).size.width-36,child: CustomTextFormField(controller: pageviewController.emailController.value, autovalidate: AutovalidateMode.onUserInteraction,  validator: Validation.emailValidator, hintText:"Enter your Email", icon: Icon(Icons.email),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.ageController.value, hintText: "Enter your Age", icon: Icon(Icons.numbers),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.phoneNoController.value, autovalidate: AutovalidateMode.onUserInteraction, validator: Validation.PhoneValidator, hintText: "Enter Contact Number", icon: Icon(Icons.phone),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.cityController.value, hintText: "Enter your City", icon: Icon(Icons.location_city),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.countryController.value, hintText: "Enter your Country", icon: Icon(Icons.location_city),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.profileHeadingController.value, hintText: "A line describing you", icon: Icon(Icons.text_fields),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: pageviewController.lookingForInaPartnerController.value, hintText: "What are you looking for in a partner", icon: Icon(Icons.face),)),
          ],
        ),
      ),
    );
  }
}