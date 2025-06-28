import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text1,
    this.text2,
    this.defaultStyle,
    this.text1Style,
    this.text2Style,
    this.overflow,
  });

  final String text1;
  final String? text2;
  final TextStyle? defaultStyle;
  final TextStyle? text1Style;
  final TextStyle? text2Style;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      style: defaultStyle,
      overflow: overflow,
      TextSpan(
        text: text1,
        style: text1Style,
        children: [TextSpan(text: text2 ?? '', style: text2Style)],
      ),
    );
  }
}
