import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:dating_app/profile_pic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widget/custom_text_form_field.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.red,
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
                    text: "Please enter your\n",
                    style: TextStyle(color: Colors.black, fontSize: 40),
                  ),
                  TextSpan(
                    text: 'Legal Name',
                    style: GoogleFonts.pacifico(
                      fontSize: 40,
                      color: Colors.yellowAccent,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30),
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
            SizedBox(
              width: MediaQuery.of(context).size.width - 36,
              child: CustomTextFormField(
                controller: nameController,
                hintText: "Enter your Name",
                inputType: TextInputType.text,
                icon: Icon(Icons.person),
              ),
            ),
            SizedBox(height: 350),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
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
                    Get.to(() => ProfilePic(), arguments: nameController.text);
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
