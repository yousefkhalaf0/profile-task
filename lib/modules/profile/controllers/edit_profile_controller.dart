import 'package:get/get.dart';

class EditProfileController extends GetxController {
  void saveProfile() {
    // Save profile logic
    Get.back();
    Get.snackbar('Success', 'Profile updated successfully');
  }

  void cancelEdit() {
    Get.back();
  }
}
