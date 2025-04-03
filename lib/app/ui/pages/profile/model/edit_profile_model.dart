class EditProfileModel {
  final bool status;
  final String message;
  final UpdatedProfile updatedProfile;

  EditProfileModel({
    required this.status,
    required this.message,
    required this.updatedProfile,
  });

  factory EditProfileModel.fromJson(Map<String, dynamic> json) {
    return EditProfileModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      updatedProfile: UpdatedProfile.fromJson(json['updated_profile'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'updated_profile': updatedProfile.toJson(),
    };
  }
}

class UpdatedProfile {
  final String name;
  final String email;
  final String profileImage;
  final String referralCode;
  final int referralPoints;
  final String password;

  UpdatedProfile({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.referralCode,
    required this.referralPoints,
    required this.password,
  });

  factory UpdatedProfile.fromJson(Map<String, dynamic> json) {
    return UpdatedProfile(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      profileImage: json['profile_image'] ?? '',
      referralCode: json['referal_code'] ?? '',
      referralPoints: json['referal_points'] ?? 0,
      password: json['password'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'profile_image': profileImage,
      'referal_code': referralCode,
      'referal_points': referralPoints,
      'password': password,
    };
  }
}
