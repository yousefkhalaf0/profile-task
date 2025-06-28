import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/helper.dart';

class SymmetricPadding extends StatelessWidget {
  const SymmetricPadding({
    super.key,
    this.verticalHeight,
    this.horizontalWidth,
    required this.child,
  });

  final Widget child;
  final double? verticalHeight;
  final double? horizontalWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: Helper.getResponsiveHeight(
          context,
          height: verticalHeight ?? 0,
        ),
        horizontal: Helper.getResponsiveWidth(
          context,
          width: horizontalWidth ?? 0,
        ),
      ),
      child: child,
    );
  }
}
