import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import 'location_screen.dart';

class OTPScreen extends StatefulWidget {
  final String verificationId;
  const OTPScreen({super.key, required this.verificationId});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  static const maxSeconds = 30;
  var seconds = Rx<int>(maxSeconds);
  Timer? timer;

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (_) {
      if (seconds > 0) {
        seconds.value--;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController otpController = TextEditingController();

    final defaultPinTheme = PinTheme(
      width: 58,
      height: 59,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.black, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
    );

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
                          text: "Verify your\n",
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
                    "Enter the code we've sent by text to ${Get.arguments}",
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
                  child: Pinput(
                    length: 6,
                    controller: otpController,
                    defaultPinTheme: defaultPinTheme,
                    showCursor: true,
                    onCompleted: (pin) => print(pin),
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
                    Obx(
                      () => seconds > 0
                          ? Text(
                              "This code should arrive within ${seconds.value}",
                            )
                          : GestureDetector(
                              child: Text("Didn't get a code?"),
                            ),
                    ),
                    IconButton(
                        onPressed: () async {
                          try {
                            PhoneAuthCredential cerdential =
                                await PhoneAuthProvider.credential(
                                    verificationId: widget.verificationId,
                                    smsCode: otpController.text.toString());
                            FirebaseAuth.instance
                                .signInWithCredential(cerdential)
                                .then((value) {
                              Get.offAll(() => LocationScreen());
                            });
                          } catch (ex) {
                            log(ex.toString());
                          }
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
