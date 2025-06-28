import 'dart:developer';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ideasnconcepts/data/services/profile_service.dart';
import 'package:ideasnconcepts/data/models/user_model.dart';
import 'package:ideasnconcepts/routes/app_routes.dart';

class ProfileController extends GetxController {
  final ProfileService _profileService = ProfileService();

  Rx<UserModel?> currentUser = Rx<UserModel?>(null);
  RxBool isLoading = false.obs;

  final String userDocumentId = 'El93GtmDED7gc1B57CWo';

  @override
  void onInit() {
    super.onInit();
    _listenToUserProfile();
  }

  void _listenToUserProfile() {
    isLoading.value = true;
    _profileService
        .getUserProfileStream(userDocumentId)
        .listen(
          (DocumentSnapshot snapshot) {
            if (snapshot.exists) {
              final data = snapshot.data() as Map<String, dynamic>;
              currentUser.value = UserModel.fromFirestore(data);
            }
            isLoading.value = false;
          },
          onError: (error) {
            isLoading.value = false;
            log('Error loading user profile: $error');
          },
        );
  }

  void navigateToEditProfile() {
    Get.toNamed(AppRoutes.editProfile);
  }

  void navigateToMyOrders() {
    Get.toNamed(AppRoutes.orders);
  }
}
