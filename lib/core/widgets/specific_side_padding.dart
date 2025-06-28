import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/helper.dart';

class SpecificSidePadding extends StatelessWidget {
  const SpecificSidePadding({
    super.key,
    this.leftPadding,
    this.rightPadding,
    this.topPadding,
    this.bottomPadding,
    required this.child,
  });

  final double? leftPadding;
  final double? rightPadding;
  final double? topPadding;
  final double? bottomPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: Helper.getResponsiveWidth(context, width: leftPadding ?? 0),
        right: Helper.getResponsiveWidth(context, width: rightPadding ?? 0),
        top: Helper.getResponsiveHeight(context, height: topPadding ?? 0),
        bottom: Helper.getResponsiveHeight(context, height: bottomPadding ?? 0),
      ),
      child: child,
    );
  }
}
