import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/strings.dart';
import 'package:ideasnconcepts/core/widgets/custom_app_bar.dart';
import 'package:ideasnconcepts/core/widgets/profile_view_body.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context, title: kMyProfile),
      body: SingleChildScrollView(child: ProfileViewBody()),
    );
  }
}
