import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/helper.dart';

abstract class Styles {
  static TextStyle textStyle12(BuildContext context) {
    return TextStyle(
      fontSize: Helper.getResponsiveFontSize(context, fontSize: 12),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle textStyle14(BuildContext context) {
    return TextStyle(
      fontSize: Helper.getResponsiveFontSize(context, fontSize: 14),
      fontWeight: FontWeight.normal,
    );
  }

  static TextStyle textStyle16(BuildContext context) {
    return TextStyle(
      fontSize: Helper.getResponsiveFontSize(context, fontSize: 16),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyle18(BuildContext context) {
    return TextStyle(
      fontSize: Helper.getResponsiveFontSize(context, fontSize: 18),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle20(BuildContext context) {
    return TextStyle(
      fontSize: Helper.getResponsiveFontSize(context, fontSize: 20),
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle textStyle24(BuildContext context) {
    return TextStyle(
      fontSize: Helper.getResponsiveFontSize(context, fontSize: 24),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle textStyle27(BuildContext context) {
    return TextStyle(
      fontSize: Helper.getResponsiveFontSize(context, fontSize: 27),
      fontWeight: FontWeight.bold,
    );
  }
}
