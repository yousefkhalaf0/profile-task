import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';
import 'package:ideasnconcepts/core/widgets/profile_picture.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';

class ProfileHeaderSection extends GetView<EditProfileController> {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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

        Container(
          margin: const EdgeInsets.only(top: 10, bottom: 30),
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          width: MediaQuery.sizeOf(context).width,
          decoration: const BoxDecoration(color: kBeige),
          child: Obx(() => _buildUserInfo(context)),
        ),
      ],
    );
  }

  Widget _buildUserInfo(BuildContext context) {
    final user = controller.currentUser.value;

    return Column(
      children: [
        CustomText(
          text1: user?.name ?? 'Loading...',
          defaultStyle: Styles.textStyle27(context).copyWith(color: kBlack),
          overflow: TextOverflow.ellipsis,
        ),
        CustomText(
          defaultStyle: const TextStyle(color: kBlack),
          overflow: TextOverflow.ellipsis,
          text1: kId,
          text1Style: Styles.textStyle14(context),
          text2: '${controller.userDocumentId.substring(0, 10)}...',
          text2Style: Styles.textStyle14(
            context,
          ).copyWith(fontWeight: FontWeight.normal),
        ),
      ],
    );
  }
}
