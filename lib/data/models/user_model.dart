import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    this.name,
    this.email,
    this.mobileNumber,
    this.profilePicture,
    this.gender,
    this.dateOfBirth,
  });

  final String? name;
  final String? email;
  final String? mobileNumber;
  final String? profilePicture;
  final bool? gender;
  final DateTime? dateOfBirth;

  factory UserModel.fromFirestore(Map<String, dynamic> data) {
    return UserModel(
      name: data['name'] as String?,
      email: data['email'] as String?,
      mobileNumber: data['mobile_number'] as String?,
      profilePicture: data['profile_picture'] as String?,
      gender: data['gender'] as bool?,
      dateOfBirth:
          data['date_of_birth'] != null
              ? (data['date_of_birth'] as Timestamp).toDate()
              : null,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'email': email,
      'mobile_number': mobileNumber,
      'profile_picture': profilePicture,
      'gender': gender,
      'date_of_birth':
          dateOfBirth != null ? Timestamp.fromDate(dateOfBirth!) : null,
    };
  }

  UserModel copyWith({
    String? name,
    String? email,
    String? mobileNumber,
    String? profilePicture,
    bool? gender,
    DateTime? dateOfBirth,
  }) {
    return UserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      profilePicture: profilePicture ?? this.profilePicture,
      gender: gender ?? this.gender,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
    );
  }
}
