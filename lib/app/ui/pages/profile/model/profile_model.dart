class ProfileModel {
  bool status;
  String message;
  ProfileData data;

  ProfileModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      data: ProfileData.fromJson(json['data'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProfileData {
  String name;
  String email;
  String profileImage;
  String referalCode;
  int referalPoints;

  ProfileData({
    required this.name,
    required this.email,
    required this.profileImage,
    required this.referalCode,
    required this.referalPoints,
  });

  factory ProfileData.fromJson(Map<String, dynamic> json) {
    return ProfileData(
      name: json['name'] as String,
      email: json['email'] as String,
      profileImage: json['profile_image'] as String,
      referalCode: json['referal_code'] as String,
      referalPoints: json['referal_points'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'profile_image': profileImage,
      'referal_code': referalCode,
      'referal_points': referalPoints,
    };
  }
}
