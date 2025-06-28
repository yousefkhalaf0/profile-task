import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/widgets/profile_form_section.dart';
import 'package:ideasnconcepts/core/widgets/profile_header_section.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';

class EditProfileViewBody extends GetView<EditProfileController> {
  const EditProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(child: CircularProgressIndicator(color: kBlack));
      }

      return const SingleChildScrollView(
        child: Column(children: [ProfileHeaderSection(), ProfileFormSection()]),
      );
    });
  }
}
