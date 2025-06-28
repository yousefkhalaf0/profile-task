import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/helper.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Helper.getResponsiveHeight(context, height: 15),
        bottom: Helper.getResponsiveHeight(context, height: 10),
      ),
      child: CircleAvatar(
        radius: Helper.getResponsiveWidth(context, width: 80),
        backgroundImage: AssetImage(''),
      ),
    );
  }
}
