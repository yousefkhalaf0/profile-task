import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/widgets/build_field_label.dart';
import 'package:ideasnconcepts/core/widgets/custom_gender_selection.dart';
import 'package:ideasnconcepts/core/widgets/custom_text_form_field.dart';
import 'package:ideasnconcepts/core/widgets/specific_side_padding.dart';
import 'package:ideasnconcepts/core/widgets/sqrcle_button.dart';
import 'package:ideasnconcepts/core/widgets/symmetric_padding.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';

class ProfileFormSection extends GetView<EditProfileController> {
  const ProfileFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SymmetricPadding(
      horizontalWidth: 40,
      child: Form(
        key: controller.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Full Name Field
            BuildFieldLabel(context: context, label: kFullName),
            SpecificSidePadding(
              bottomPadding: 10,
              child: CustomTextFormField(
                controller: controller.nameController,
                keyboardType: TextInputType.name,
                validator: controller.validateName,
              ),
            ),

            // Email Field
            BuildFieldLabel(context: context, label: kEmail),
            SpecificSidePadding(
              bottomPadding: 10,
              child: CustomTextFormField(
                controller: controller.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: controller.validateEmail,
              ),
            ),

            // Mobile Number Field
            BuildFieldLabel(context: context, label: kMobileNumber),
            SpecificSidePadding(
              bottomPadding: 10,
              child: CustomTextFormField(
                controller: controller.mobileController,
                keyboardType: TextInputType.phone,
                validator: controller.validateMobile,
              ),
            ),

            // Date of Birth Field
            BuildFieldLabel(context: context, label: kDateOfBirth),
            SpecificSidePadding(
              bottomPadding: 30,
              child: CustomTextFormField(
                controller: controller.dobController,
                isDatePicker: true,
                onDateSelected: controller.onDateSelected,
                validator: controller.validateDateOfBirth,
              ),
            ),

            BuildFieldLabel(context: context, label: kGender),
            SpecificSidePadding(
              bottomPadding: 25,
              child: const CustomGenderSelection(),
            ),

            // Update Button
            SpecificSidePadding(
              bottomPadding: 20,
              child: SqrcleButton(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
