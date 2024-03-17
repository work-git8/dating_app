import 'dart:io';

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
      Get.snackbar(
          "Profile Image", "You have successfully picked your profile image.");
      if (imagePickerIndex >= 0 && imagePickerIndex < images.length) {
        images[imagePickerIndex] = imageFile;
      }
    }

    //pickedFile = Rx<File?>(File(imageFile!.path));
  }

  pickImageFileFromPhoneCamera(int imagePickerIndex) async {
    final imageFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (imageFile != null) {
      Get.snackbar(
          "Profile Image", "You have successfully picked your profile image.");
      if (imagePickerIndex >= 0 && imagePickerIndex < images.length) {
        images[imagePickerIndex] = imageFile;
      }
    }

    //pickedFile = Rx<File?>(File(imageFile!.path));
  }

  Future<List<String>> uploadImages(List<XFile?> images) async {
    List<String> uploadedImageUrls = [];

    for (int i = 0; i < images.length; i++) {
      XFile? image = images[i];
      if (image != null) {
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
      }
    }

    return uploadedImageUrls;
  }
}
