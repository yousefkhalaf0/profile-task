import 'dart:developer';
import 'package:get/get.dart';
import 'package:ideasnconcepts/data/services/profile_service.dart';
import 'package:ideasnconcepts/routes/app_routes.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();

  RxString profileImageUrl = ''.obs;
  RxBool isLoading = false.obs;

  final String userDocumentId = 'El93GtmDED7gc1B57CWo';

  @override
  void onInit() {
    super.onInit();
    loadProfilePicture();
  }

  Future<void> loadProfilePicture() async {
    try {
      isLoading.value = true;
      profileImageUrl.value = await _profileService.loadProfilePicture(
        userDocumentId,
      );
    } catch (e) {
      log('Error loading profile picture in ProfileController: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void navigateToEditProfile() {
    Get.toNamed(AppRoutes.editProfile);
  }

  void navigateToMyOrders() {
    Get.toNamed(AppRoutes.orders);
  }

  void listenToProfileUpdates() {
    _profileService.getUserProfileStream(userDocumentId).listen((snapshot) {
      if (snapshot.exists) {
        Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
        profileImageUrl.value = data['profile_picture'] ?? '';
      }
    });
  }
}
