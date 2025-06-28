import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ideasnconcepts/core/constants/colors.dart';
import 'package:ideasnconcepts/core/helper.dart';

class ProfilePicture extends StatelessWidget {
  const ProfilePicture({
    super.key,
    this.onTap,
    this.showCameraIcon = false,
    this.imagePath,
    this.imageUrl,
    this.defaultAssetPath = 'assets/images/user.png',
    this.isUploading = false,
  });

  final VoidCallback? onTap;
  final bool showCameraIcon;
  final String? imagePath;
  final String? imageUrl;
  final String defaultAssetPath;
  final bool isUploading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: Helper.getResponsiveHeight(context, height: 15),
        bottom: Helper.getResponsiveHeight(context, height: 10),
      ),
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Stack(
              children: [
                CircleAvatar(
                  radius: Helper.getResponsiveWidth(context, width: 80),
                  backgroundImage: _getImageProvider(),
                ),
                if (isUploading)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black.withValues(alpha: 0.5),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 3,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (showCameraIcon)
            Positioned(
              bottom: 0,
              right: 0,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  width: Helper.getResponsiveWidth(context, width: 35),
                  height: Helper.getResponsiveWidth(context, width: 35),
                  decoration: BoxDecoration(
                    color: kSalmon,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: kBlack,
                    size: Helper.getResponsiveWidth(context, width: 20),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  ImageProvider _getImageProvider() {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return FileImage(File(imagePath!));
    } else if (imageUrl != null && imageUrl!.isNotEmpty) {
      return NetworkImage(imageUrl!);
    }
    return AssetImage(defaultAssetPath);
  }
}
