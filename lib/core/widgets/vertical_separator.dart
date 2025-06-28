import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/helper.dart';

class VerticalSeparator extends StatelessWidget {
  const VerticalSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Helper.getResponsiveWidth(context, width: 1),
      height: Helper.getResponsiveHeight(context, height: 40),
      color: kWhite,
    );
  }
}
