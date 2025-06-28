import 'package:get/get.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';
import 'package:ideasnconcepts/modules/profile/controllers/orders_controller.dart';
import 'package:ideasnconcepts/modules/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(() => ProfileController());

    Get.lazyPut<EditProfileController>(() => EditProfileController());

    Get.lazyPut<MyOrdersController>(() => MyOrdersController());
  }
}
