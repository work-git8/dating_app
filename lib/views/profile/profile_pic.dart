import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:dating_app/controller/image_controller.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  final imageCont = ImageController.imageController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orangeAccent,
      child: Column(
        children: [
          SizedBox(height: 80),
          RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              children: [
                TextSpan(
                  text: "Please attach some\n",
                  style: TextStyle(color: Colors.black, fontSize: 40),
                ),
                TextSpan(
                  text: 'Photos of yourself',
                  style: GoogleFonts.pacifico(
                    fontSize: 40,
                    color: Colors.red,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               GestureDetector(
              onTap: () => _pickImage(0),
              child: _buildImageContainer(0),
            ),
            SizedBox(height: 20),
            GestureDetector(
              onTap: () => _pickImage(1),
              child: _buildImageContainer(1),
            ),
            ],
          )      
        ],
      ),
    );
  }

  Widget _buildImageContainer(int index) {
    return Container(
      height: 150,
      width: 150,
      child: imageCont.images[index] == null
          ? Icon(Icons.add)
          : ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: getImageWidget(imageCont.images[index]!.path),
            ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  void _pickImage(int index) {
    Get.defaultDialog(
      title: "Pick Image from...",
      content: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              imageCont.pickImageFileFromPhoneCamera(index).then((_) {
                setState(() {});
              });
            },
            icon: Icon(Icons.camera_alt, size: 50),
          ),
          SizedBox(width: 10),
          IconButton(
            onPressed: () {
              imageCont.pickImageFileFromGallery(index).then((_) {
                setState(() {});
              });
            },
            icon: Icon(
              Icons.folder,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }

Widget getImageWidget(String path) {
  if (path.startsWith('http') || path.startsWith('https')) {
    return Image.network(
      path,fit: BoxFit.cover,
    );
  } else {
    return Image.file(
      File(path),fit: BoxFit.cover,
    );
  }
}

}
