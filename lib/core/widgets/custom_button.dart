import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/helper.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.text, this.icon, this.onPressed});

  final String? text;
  final IconData? icon;
  final GestureTapCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 3,
          children: [
            icon != null
                ? Icon(
                  icon,
                  size: Helper.getResponsiveWidth(context, width: 35),
                  color: kBlack,
                )
                : const SizedBox.shrink(),
            text != null
                ? CustomText(
                  text1: '$text',
                  defaultStyle: Styles.textStyle12(
                    context,
                  ).copyWith(color: kBlack),
                )
                : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
