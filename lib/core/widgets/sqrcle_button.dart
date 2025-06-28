import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/helper.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';

class SqrcleButton extends GetView<EditProfileController> {
  const SqrcleButton({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: Helper.getResponsiveHeight(context, height: 50),
      child: ElevatedButton(
        onPressed:
            controller.isUpdating.value ? null : controller.updateProfile,
        style: ElevatedButton.styleFrom(
          backgroundColor: kTerracotta,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 5,
        ),
        child:
            controller.isUpdating.value
                ? const SizedBox(
                  width: 20,
                  height: 20,
                  child: CircularProgressIndicator(
                    color: kWhite,
                    strokeWidth: 2,
                  ),
                )
                : CustomText(
                  text1: kUpdateProfile,
                  defaultStyle: Styles.textStyle20(
                    context,
                  ).copyWith(color: kWhite, fontWeight: FontWeight.bold),
                ),
      ),
    );
  }
}
