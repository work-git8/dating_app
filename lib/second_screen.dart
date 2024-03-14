import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'mobile_number_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          color: Colors.red,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                'Bumble',
                style: GoogleFonts.pacifico(
                    fontSize: 50,
                    color: Colors.yellowAccent,
                    decoration: TextDecoration.none),
              ),
            ),
            AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('MAKE THE FIRST MOVE',
                    textStyle: GoogleFonts.aclonica(
                        color: Colors.white,
                        fontSize: 30,
                        backgroundColor: Colors.transparent,
                        decoration: TextDecoration.none)),
                TyperAnimatedText('FRIENDSHIP, DATING, LOVE',
                    textStyle: GoogleFonts.actor(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        decoration: TextDecoration.none)),
              ],
            ),
            SizedBox(height: 300),
            Text(
              "You signed in with your mobile number",
              style: TextStyle(
                  fontFamily: 'Josefin Sans',
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontSize: 15),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 300,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Continue with Facebook",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                    elevation: MaterialStateProperty.all(10),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueAccent)),
              ),
            ),
            SizedBox(height: 10),
            SizedBox(
                width: 300,
                child: ElevatedButton(
                    style:
                        ButtonStyle(elevation: MaterialStateProperty.all(10)),
                    onPressed: () {
                      Get.to(() => MobileNumberScreen());
                    },
                    child: Text("Use Mobile Number",
                        style: TextStyle(fontSize: 20, color: Colors.black)))),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(30),
              child: Text(
                "         By signing up, you agree to our Terms\n See how we use your data in our Privacy policy.\n \t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tWe never post to Facebook",
                style: TextStyle(
                    decoration: TextDecoration.none,
                    color: Colors.black,
                    fontSize: 15,
                    fontFamily: 'Caveat'),
              ),
            )
          ],
        ),
      ],
    );
  }
}
