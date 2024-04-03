import 'package:dating_app/controller/pageview_controller.dart';
import 'package:dating_app/views/homeScreen/tabScreens/user_details_screen.dart';
import 'package:dating_app/views/profile/profile_pic.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widget/custom_text_form_field.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
    final pageviewController = Get.find<PageviewController>();

  @override
  Widget build(BuildContext context) {
  
    return Container(
      alignment: Alignment.center,
      color: Colors.orangeAccent,
      child: ListView(   
        children: [
          SizedBox(height: 80),
          Padding(
            padding: EdgeInsets.only(left:30, right: 30,bottom: 30),
            child: RichText(
              text: TextSpan(
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                children: [
                  TextSpan(
                    text: "Please enter your\n",
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  TextSpan(
                    text: 'Legal Name',
                    style: GoogleFonts.pacifico(
                      fontSize: 40,
                      color: Colors.red,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30, top: 0, right: 30, bottom: 0),
            child: Text(
              "We protect our community by making sure everyone on Bumble is real",
              style: TextStyle(
                decoration: TextDecoration.none,
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Caveat',
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.all(30),
            child: CustomTextFormField(
              controller: pageviewController.nameController.value,
              hintText: "Enter your Name",
              inputType: TextInputType.text,
              icon: Icon(Icons.person),
            ),
          ),
        ],
      ),
    );
  }
}
