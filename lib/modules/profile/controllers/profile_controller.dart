import 'package:get/get.dart';
import 'package:ideasnconcepts/routes/app_routes.dart';

class ProfileController extends GetxController {
  void navigateToEditProfile() {
    Get.toNamed(AppRoutes.editProfile);
  }

  void navigateToMyOrders() {
    Get.toNamed(AppRoutes.orders);
  }
}
