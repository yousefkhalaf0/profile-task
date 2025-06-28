import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/widgets/custom_icon.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';
import 'package:ideasnconcepts/core/widgets/specific_side_padding.dart';

class ListTileButton extends StatelessWidget {
  const ListTileButton({super.key, required this.title, required this.icon});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SpecificSidePadding(
      bottomPadding: 3,
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        leading: CustomIcon(icon: icon),
        title: CustomText(
          text1: title,
          defaultStyle: Styles.textStyle20(
            context,
          ).copyWith(color: kBlack, fontWeight: FontWeight.w500),
        ),
        onTap: () {},
      ),
    );
  }
}
