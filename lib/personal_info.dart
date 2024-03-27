import 'package:dating_app/appearance.dart';
import 'package:dating_app/controller/personal_info_controller.dart';
import 'package:dating_app/validation/validation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/custom_text_form_field.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {

  final personalInfoController = Get.put(PersonalInfoController());

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
            SizedBox(width: MediaQuery.of(context).size.width-36,child: CustomTextFormField(controller: personalInfoController.emailController.value, autovalidate: AutovalidateMode.onUserInteraction,  validator: Validation.emailValidator, hintText:"Enter your Email", icon: Icon(Icons.email),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: personalInfoController.ageController.value, hintText: "Enter your Age", icon: Icon(Icons.numbers),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: personalInfoController.phoneNoController.value, autovalidate: AutovalidateMode.onUserInteraction, validator: Validation.PhoneValidator, hintText: "Enter Contact Number", icon: Icon(Icons.phone),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: personalInfoController.cityController.value, hintText: "Enter your City", icon: Icon(Icons.location_city),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: personalInfoController.countryController.value, hintText: "Enter your Country", icon: Icon(Icons.location_city),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: personalInfoController.profileHeadingController.value, hintText: "A line describing you", icon: Icon(Icons.text_fields),)),
            SizedBox(height: 10,),
            SizedBox(width: MediaQuery.of(context).size.width-36, child: CustomTextFormField(controller: personalInfoController.lookingForInaPartnerController.value, hintText: "What are you looking for in a partner", icon: Icon(Icons.face),)),
            SizedBox(height: 130),
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
                    Get.to(() => AppearanceDetails(), arguments: '');
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