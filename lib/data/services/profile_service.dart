import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloudinary_public/cloudinary_public.dart';

class ProfileService {
  static final ProfileService _instance = ProfileService._internal();
  factory ProfileService() => _instance;
  ProfileService._internal();

  final CloudinaryPublic _cloudinary = CloudinaryPublic(
    'dwvfllxsv',
    'assets',
    cache: false,
  );
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String usersCollection = 'users';
  static const String profilePictureField = 'profile_picture';
  static const String profilePicturesFolder = 'profile_pictures';

  Future<String> loadProfilePicture(String userDocumentId) async {
    try {
      DocumentSnapshot doc =
          await _firestore
              .collection(usersCollection)
              .doc(userDocumentId)
              .get();

      if (doc.exists) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        return data[profilePictureField] ?? '';
      }
      return '';
    } catch (e) {
      log('Error loading profile picture: $e');
      rethrow;
    }
  }

  Future<String> uploadImageToCloudinary(
    File imageFile,
    String userDocumentId,
  ) async {
    try {
      CloudinaryResponse response = await _cloudinary.uploadFile(
        CloudinaryFile.fromFile(
          imageFile.path,
          folder: profilePicturesFolder,
          publicId:
              'profile_${userDocumentId}_${DateTime.now().millisecondsSinceEpoch}',
        ),
      );

      if (response.secureUrl.isNotEmpty) {
        return response.secureUrl;
      } else {
        throw Exception('No URL received from Cloudinary');
      }
    } catch (e) {
      log('Error uploading image to Cloudinary: $e');
      rethrow;
    }
  }

  Future<void> updateProfilePictureInFirestore(
    String imageUrl,
    String userDocumentId,
  ) async {
    try {
      await _firestore.collection(usersCollection).doc(userDocumentId).update({
        profilePictureField: imageUrl,
      });
    } catch (e) {
      log('Error updating Firestore: $e');
      rethrow;
    }
  }

  Future<String> uploadAndSaveProfilePicture(
    File imageFile,
    String userDocumentId,
  ) async {
    try {
      String imageUrl = await uploadImageToCloudinary(
        imageFile,
        userDocumentId,
      );

      await updateProfilePictureInFirestore(imageUrl, userDocumentId);

      return imageUrl;
    } catch (e) {
      log('Error in complete upload process: $e');
      rethrow;
    }
  }

  Stream<DocumentSnapshot> getUserProfileStream(String userDocumentId) {
    return _firestore
        .collection(usersCollection)
        .doc(userDocumentId)
        .snapshots();
  }
}
