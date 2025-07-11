import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/widgets/custom_button.dart';
import 'package:ideasnconcepts/core/widgets/specific_side_padding.dart';
import 'package:ideasnconcepts/core/widgets/symmetric_padding.dart';
import 'package:ideasnconcepts/core/widgets/vertical_separator.dart';
import 'package:ideasnconcepts/modules/profile/controllers/profile_controller.dart';

class ButtonsContainer extends GetView<ProfileController> {
  const ButtonsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return SpecificSidePadding(
      topPadding: 15,
      bottomPadding: 25,
      child: Container(
        decoration: BoxDecoration(
          color: kSalmon,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SymmetricPadding(
          verticalHeight: 12,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButton(
                onPressed: () {
                  controller.navigateToEditProfile();
                },
                icon: Icons.person_3_outlined,
                text: kProfile,
              ),
              VerticalSeparator(),
              CustomButton(
                onPressed: () {},
                icon: Icons.favorite_outline,
                text: kWishList,
              ),
              VerticalSeparator(),
              CustomButton(
                onPressed: () {
                  controller.navigateToMyOrders();
                },
                icon: Icons.shopping_bag_outlined,
                text: kMyOrders,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
