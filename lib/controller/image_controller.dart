import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dating_app/core/global.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  static ImageController imageController = Get.find();

  // late Rx<File?> pickedFile;
  // File? get profileImage => pickedFile.value;
  List<XFile?> images = List.filled(10, null);

  pickImageFileFromGallery(int imagePickerIndex) async {
    final imageFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (imageFile != null) {
      // Get.snackbar(
      //     "Profile Image", "You have successfully picked your profile image.");
          Fluttertoast.showToast(
          msg: "You have successfully picked your profile image.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      if (imagePickerIndex >= 0 && imagePickerIndex < images.length) {
        images[imagePickerIndex] = imageFile;
      }
    }
    Get.back();
    //pickedFile = Rx<File?>(File(imageFile!.path));
  }

  pickImageFileFromPhoneCamera(int imagePickerIndex) async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      // Get.snackbar(
      //     "Profile Image", "You have successfully picked your profile image.", snackPosition: SnackPosition.BOTTOM);
      Fluttertoast.showToast(
          msg: "You have successfully picked your profile image.",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0,
        );
      if (imagePickerIndex >= 0 && imagePickerIndex < images.length) {
        images[imagePickerIndex] = imageFile;
      }
    }
    Get.back();
    //pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<List<String>> uploadImages(List<XFile?> images) async {
    List<String> uploadedImageUrls = [];

    for (int i = 0; i < images.length; i++) {
      XFile? image = images[i];
      if (image != null) {
         if (isImagePathFile(image.path)) {
        File file = File(image.path); // Convert XFile to File
        String fileName =
            DateTime.now().millisecondsSinceEpoch.toString() + '_$i.jpg';
        // String fileName = FirebaseAuth.instance.currentUser!.uid + '_$i.jpg';
        Reference ref = FirebaseStorage.instance
            .ref()
            .child("Profile images")
            .child(fileName);

        await ref.putFile(file);
        String downloadURL = await ref.getDownloadURL();
        uploadedImageUrls.add(downloadURL);
         } else {
        // If image path is a network path, directly add it to uploadedImageUrls
        uploadedImageUrls.add(image.path);
      }
     }
    }
    return uploadedImageUrls;
  }
  

  fillImageDetails() async {
    List<String> uploadedUrls = await imageController.uploadImages(imageController.images);
    print(uploadedUrls);
    await FirebaseFirestore.instance.collection('users').doc(currentUserID).update({'imageProfile': uploadedUrls,});                      
  }

  bool isImagePathFile(String path) {
  return !path.startsWith('http') && !path.startsWith('https');
 }

  @override
  void onClose(){
    imageController.dispose();
    super.onClose();
  }
}
