import 'dart:io';

import 'package:dating_app/controller/image_controller.dart';
import 'package:dating_app/tabScreens/user_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreen/home_screen.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({super.key});

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  var imageCont = ImageController.imageController;

  @override
  Widget build(BuildContext context) {
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
                          text: "Please attach some\n",
                          style: TextStyle(color: Colors.black, fontSize: 40),
                        ),
                        TextSpan(
                          text: 'Photos of yourself',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          title: "Pick Image from...",
                          content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      imageCont
                                          .pickImageFileFromPhoneCamera(0)
                                          .then((_) {
                                        setState(() {});
                                      });
                                    },
                                    icon: Icon(Icons.camera_alt, size: 50)),
                                SizedBox(width: 10),
                                IconButton(
                                    onPressed: () {
                                      imageCont
                                          .pickImageFileFromGallery(0)
                                          .then((_) {
                                        setState(() {});
                                      });
                                    },
                                    icon: Icon(
                                      Icons.folder,
                                      size: 50,
                                    ))
                              ]),
                        );
                      },
                      child: imageCont.images[0] == null
                          ? Container(
                              height: 120,
                              width: 120,
                              child: Icon(Icons.add),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            )
                          : Container(
                              height: 150,
                              width: 150,
                              child: Icon(Icons.add),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(imageCont.images[0]!.path))),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.defaultDialog(
                          title: "Pick Image from...",
                          content: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      imageCont
                                          .pickImageFileFromPhoneCamera(1)
                                          .then((_) {
                                        setState(() {});
                                      });
                                    },
                                    icon: Icon(Icons.camera_alt, size: 50)),
                                SizedBox(width: 10),
                                IconButton(
                                    onPressed: () {
                                      imageCont
                                          .pickImageFileFromGallery(1)
                                          .then((_) {
                                        setState(() {});
                                      });
                                    },
                                    icon: Icon(
                                      Icons.folder,
                                      size: 50,
                                    ))
                              ]),
                        );
                      },
                      child: imageCont.images[1] == null
                          ? Container(
                              height: 120,
                              width: 120,
                              child: Icon(Icons.add),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            )
                          : Container(
                              height: 150,
                              width: 150,
                              child: Icon(Icons.add),
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: FileImage(
                                          File(imageCont.images[1]!.path))),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                            ),
                    ),
                  ],
                ),
                SizedBox(height: 300),
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
                    ),
                    IconButton(
                        onPressed: () async {
                          List<String> uploadedUrls =
                              await imageCont.uploadImages(imageCont.images);
                          print(uploadedUrls);
                          //Get.to(() => HomeScreen(), arguments: "");
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
