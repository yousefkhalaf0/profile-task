import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/helper.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';
import 'package:ideasnconcepts/data/services/profile_service.dart';
import 'package:ideasnconcepts/data/models/user_model.dart';
import 'package:ideasnconcepts/routes/app_routes.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileController extends GetxController {
  final ImagePicker _picker = ImagePicker();
  final ProfileService _profileService = ProfileService();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  RxString profileImagePath = ''.obs;
  RxString profileImageUrl = ''.obs;
  RxBool isUploading = false.obs;
  RxBool isLoading = false.obs;
  RxBool isUpdating = false.obs;
  RxString selectedGender = ''.obs;
  Rx<DateTime?> selectedDate = Rx<DateTime?>(null);
  Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  final String userDocumentId = 'El93GtmDED7gc1B57CWo';

  @override
  void onInit() {
    super.onInit();
    _listenToUserProfile();
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    mobileController.dispose();
    dobController.dispose();
    super.onClose();
  }

  void _listenToUserProfile() {
    isLoading.value = true;
    _profileService
        .getUserProfileStream(userDocumentId)
        .listen(
          (DocumentSnapshot snapshot) {
            if (snapshot.exists) {
              final data = snapshot.data() as Map<String, dynamic>;
              final user = UserModel.fromFirestore(data);
              currentUser.value = user;
              _populateFormFields(user);
            }
            isLoading.value = false;
          },
          onError: (error) {
            isLoading.value = false;
            _showErrorSnackbar('Failed to load profile: ${error.toString()}');
          },
        );
  }

  void _populateFormFields(UserModel user) {
    nameController.text = user.name ?? '';
    emailController.text = user.email ?? '';
    mobileController.text = user.mobileNumber ?? '';
    profileImageUrl.value = user.profilePicture ?? '';

    if (user.gender != null) {
      selectedGender.value = user.gender! ? kMale : kFemale;
    }

    if (user.dateOfBirth != null) {
      selectedDate.value = user.dateOfBirth;
      dobController.text = _formatDate(user.dateOfBirth!);
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day.toString().padLeft(2, '0')}/"
        "${date.month.toString().padLeft(2, '0')}/"
        "${date.year}";
  }

  void setGender(String gender) {
    selectedGender.value = gender;
  }

  void onDateSelected(DateTime date) {
    selectedDate.value = date;
    dobController.text = _formatDate(date);
  }

  String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? validateMobile(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Mobile number is required';
    }
    if (value.trim().length < 10) {
      return 'Mobile number must be at least 10 digits';
    }
    return null;
  }

  String? validateDateOfBirth(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Date of birth is required';
    }
    if (selectedDate.value == null) {
      return 'Please select a valid date';
    }
    return null;
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

  Future<void> updateProfile() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    try {
      isUpdating.value = true;

      final updatedUser = UserModel(
        name: nameController.text.trim(),
        email: emailController.text.trim(),
        mobileNumber: mobileController.text.trim(),
        profilePicture:
            profileImageUrl.value.isEmpty ? null : profileImageUrl.value,
        gender: selectedGender.value == kMale,
        dateOfBirth: selectedDate.value,
      );

      await _profileService.updateUserProfile(userDocumentId, updatedUser);

      _showSuccessSnackbar('Profile updated successfully');

      Get.offNamed(AppRoutes.profile);
    } catch (e) {
      _showErrorSnackbar('Failed to update profile: ${e.toString()}');
    } finally {
      isUpdating.value = false;
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
