import 'package:dating_app/widget/custom_text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'otp_screen.dart';

class MobileNumberScreen extends StatefulWidget {
  const MobileNumberScreen({super.key});

  @override
  State<MobileNumberScreen> createState() => _MobileNumberScreenState();
}

class _MobileNumberScreenState extends State<MobileNumberScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController phoneController = TextEditingController();
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            color: Colors.red,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 80,
                ),
                RichText(
                  text: TextSpan(
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      children: [
                        TextSpan(
                          text: "Give us your\n",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        ),
                        TextSpan(
                          text: 'Contact Number',
                          style: GoogleFonts.pacifico(
                              fontSize: 40,
                              color: Colors.yellowAccent,
                              decoration: TextDecoration.none),
                        ),
                      ]),
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
                        fontStyle: FontStyle.italic),
                  ),
                ),
                SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 36,
                  child: CustomTextFormField(
                    controller: phoneController,
                    hintText: "Enter Contact Number",
                    inputType: TextInputType.phone,
                    icon: Icon(Icons.call_outlined),
                  ),
                ),
                SizedBox(height: 350),
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
                    Icon(Icons.lock),
                    Text(
                      "We never share this with anyone and\n it won't be in your profile",
                      softWrap: true,
                    ),
                    IconButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.verifyPhoneNumber(
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException ex) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                Get.to(
                                    () => OTPScreen(
                                          verificationId: verificationId,
                                        ),
                                    arguments: phoneController.text);
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                              phoneNumber: phoneController.text.toString());
                        },
                        color: Colors.black,
                        splashColor: Colors.amber,
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        icon: Icon(Icons.arrow_forward_ios_outlined))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
