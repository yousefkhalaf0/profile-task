import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/helper.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';
import 'package:ideasnconcepts/data/services/profile_service.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final ProfileService _profileService = ProfileService();

  RxString profileImagePath = ''.obs;
  RxString profileImageUrl = ''.obs;
  RxBool isUploading = false.obs;

  final String userDocumentId = 'El93GtmDED7gc1B57CWo';

  @override
  void onInit() {
    super.onInit();
    loadCurrentProfilePicture();
  }

  Future<void> loadCurrentProfilePicture() async {
    try {
      profileImageUrl.value = await _profileService.loadProfilePicture(
        userDocumentId,
      );
    } catch (e) {
      _showErrorSnackbar('Failed to load profile picture: ${e.toString()}');
    }
  }

  Future<void> pickProfileImage(BuildContext context) async {
    try {
      final String? source = await _showImageSourceDialog(context);

      if (source != null) {
        final XFile? pickedFile = await _picker.pickImage(
          source: source == 'camera' ? ImageSource.camera : ImageSource.gallery,
          maxWidth: 800,
          maxHeight: 800,
          imageQuality: 85,
        );

        if (pickedFile != null) {
          profileImagePath.value = pickedFile.path;
          await _uploadImageToCloudinary(File(pickedFile.path));
        }
      }
    } catch (e) {
      _showErrorSnackbar('Failed to pick image: ${e.toString()}');
    }
  }

  Future<void> _uploadImageToCloudinary(File imageFile) async {
    try {
      isUploading.value = true;

      String imageUrl = await _profileService.uploadAndSaveProfilePicture(
        imageFile,
        userDocumentId,
      );

      profileImageUrl.value = imageUrl;
      _showSuccessSnackbar('Profile picture uploaded successfully');
    } catch (e) {
      _showErrorSnackbar('Failed to upload image: ${e.toString()}');
    } finally {
      isUploading.value = false;
    }
  }

  Future<String?> _showImageSourceDialog(BuildContext context) async {
    return await Get.bottomSheet(
      Container(
        height: Helper.getResponsiveHeight(context, height: 220),
        decoration: const BoxDecoration(
          color: kWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CustomText(
              text1: kSelectImageSource,
              defaultStyle: Styles.textStyle18(context).copyWith(color: kBlack),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => Get.back(result: 'camera'),
                  child: const Column(
                    children: [
                      Icon(Icons.camera_alt, size: 40, color: Colors.blue),
                      SizedBox(height: 8),
                      CustomText(text1: kCamera),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => Get.back(result: 'gallery'),
                  child: const Column(
                    children: [
                      Icon(Icons.photo_library, size: 40, color: Colors.green),
                      SizedBox(height: 8),
                      CustomText(text1: kGallery),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () => Get.back(),
              child: const CustomText(text1: kCancel),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  // Future<void> refreshProfile() async {
  //   await loadProfilePicture();
  // }

  void saveProfile() {
    Get.back();
    _showSuccessSnackbar('Profile updated successfully');
  }

  void cancelEdit() {
    Get.back();
  }

  void _showSuccessSnackbar(String message) {
    Get.snackbar(
      'Success',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
    );
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      'Error',
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
    );
  }
}
