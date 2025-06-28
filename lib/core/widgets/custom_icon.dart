import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/helper.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kSalmon,
        borderRadius: BorderRadius.circular(100),
      ),
      child: Padding(
        padding: EdgeInsets.all(Helper.getResponsiveWidth(context, width: 6)),
        child: Icon(
          icon,
          color: kBlack,
          size: Helper.getResponsiveWidth(context, width: 25),
        ),
      ),
    );
  }
}
