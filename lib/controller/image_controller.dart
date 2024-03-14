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
}
