import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/widgets/buttonscontainer.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';
import 'package:ideasnconcepts/core/widgets/profile_menu_options.dart';
import 'package:ideasnconcepts/core/widgets/profile_picture.dart';
import 'package:ideasnconcepts/core/widgets/symmetric_padding.dart';
import 'package:ideasnconcepts/modules/profile/controllers/profile_controller.dart';

class ProfileViewBody extends GetView<ProfileController> {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SymmetricPadding(
      horizontalWidth: 40,
      child: Center(
        child: Column(
          children: [
            Obx(
              () => ProfilePicture(
                imageUrl: controller.currentUser.value?.profilePicture,
              ),
            ),
            Obx(
              () => CustomText(
                text1: controller.currentUser.value?.name ?? 'Loading...',
                defaultStyle: Styles.textStyle27(
                  context,
                ).copyWith(color: kBlack),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            CustomText(
              defaultStyle: TextStyle(color: kBlack),
              overflow: TextOverflow.ellipsis,
              text1: kId,
              text1Style: Styles.textStyle14(context),
              text2: controller.userDocumentId,
              text2Style: Styles.textStyle14(
                context,
              ).copyWith(fontWeight: FontWeight.normal),
            ),
            ButtonsContainer(),
            ProfileMenuOptions(),
          ],
        ),
      ),
    );
  }
}
