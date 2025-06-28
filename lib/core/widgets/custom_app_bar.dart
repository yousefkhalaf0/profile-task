import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/constants/styles.dart';
import 'package:ideasnconcepts/core/helper.dart';
import 'package:ideasnconcepts/core/widgets/custom_text.dart';

// ignore: non_constant_identifier_names
AppBar CustomAppBar(
  BuildContext context, {
  required String title,
  VoidCallback? onBackPressed,
  VoidCallback? onEditPressed,
}) {
  return AppBar(
    surfaceTintColor: kBeige,
    centerTitle: true,
    title: CustomText(
      text1: title,
      defaultStyle: Styles.textStyle20(context).copyWith(color: kSalmon),
    ),
    leading: Padding(
      padding: EdgeInsets.only(
        left: Helper.getResponsiveWidth(context, width: 20),
      ),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: kBlack,
          size: Helper.getResponsiveWidth(context, width: 30),
        ),
        onPressed: onBackPressed ?? () {},
      ),
    ),
    actions: [
      Padding(
        padding: EdgeInsets.only(
          right: Helper.getResponsiveWidth(context, width: 20),
        ),
        child: IconButton(
          icon: Icon(
            Icons.edit,
            color: kSalmon,
            size: Helper.getResponsiveWidth(context, width: 30),
          ),
          onPressed: onEditPressed ?? () {},
        ),
      ),
    ],
  );
}
