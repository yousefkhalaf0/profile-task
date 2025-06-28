import 'package:get/get.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';
import 'package:ideasnconcepts/modules/profile/controllers/orders_controller.dart';
import 'package:ideasnconcepts/modules/profile/controllers/profile_controller.dart';

class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ProfileController>(ProfileController(), permanent: true);

    Get.lazyPut<EditProfileController>(
      () => EditProfileController(),
      fenix: true,
    );

    Get.lazyPut<MyOrdersController>(() => MyOrdersController());
  }
}
