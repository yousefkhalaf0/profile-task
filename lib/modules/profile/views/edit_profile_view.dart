import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/widgets/custom_app_bar.dart';
import 'package:ideasnconcepts/core/widgets/edit_profile_view_body.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        context,
        title: kMyProfile,
        onBackPressed: controller.cancelEdit,
      ),
      body: SingleChildScrollView(child: EditProfileViewBody()),
    );
  }
}
