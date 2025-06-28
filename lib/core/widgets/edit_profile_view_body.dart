import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ideasnconcepts/core/widgets/profile_picture.dart';
import 'package:ideasnconcepts/core/widgets/symmetric_padding.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';

class EditProfileViewBody extends GetView<EditProfileController> {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SymmetricPadding(
      horizontalWidth: 40,
      child: Center(
        child: Column(
          children: [
            Obx(
              () => ProfilePicture(
                onTap: () => controller.pickProfileImage(context),
                showCameraIcon: true,
                imagePath:
                    controller.profileImagePath.value.isNotEmpty
                        ? controller.profileImagePath.value
                        : null,
                imageUrl:
                    controller.profileImageUrl.value.isNotEmpty
                        ? controller.profileImageUrl.value
                        : null,
                isUploading: controller.isUploading.value,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
