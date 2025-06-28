import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';
import 'package:ideasnconcepts/core/widgets/specific_side_padding.dart';

class BuildFieldLabel extends StatelessWidget {
  const BuildFieldLabel({
    super.key,
    required this.context,
    required this.label,
  });

  final BuildContext context;
  final String label;

  @override
  Widget build(BuildContext context) {
    return SpecificSidePadding(
      bottomPadding: 5,
      child: CustomText(
        text1: label,
        defaultStyle: Styles.textStyle16(
          context,
        ).copyWith(color: kBlack, fontWeight: FontWeight.w600),
      ),
    );
  }
}
