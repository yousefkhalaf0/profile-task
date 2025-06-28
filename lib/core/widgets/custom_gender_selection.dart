import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';
import 'package:ideasnconcepts/modules/profile/controllers/edit_profile_controller.dart';

class CustomGenderSelection extends GetView<EditProfileController> {
  const CustomGenderSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final genderOptions = [kMale, kFemale];

    return Obx(
      () => Column(
        children: [
          Row(
            children:
                genderOptions
                    .map(
                      (gender) => Expanded(
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: kBeige,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: RadioListTile<String>(
                            fillColor: WidgetStateProperty.all(kSalmon),
                            visualDensity: VisualDensity.compact,
                            title: CustomText(
                              text1: gender,
                              defaultStyle: const TextStyle(
                                color: kBlack,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            value: gender,
                            groupValue: controller.selectedGender.value,
                            onChanged: (value) => controller.setGender(value!),
                            activeColor: kBlack,
                            contentPadding: EdgeInsets.zero,
                          ),
                        ),
                      ),
                    )
                    .toList(),
          ),
        ],
      ),
    );
  }
}
