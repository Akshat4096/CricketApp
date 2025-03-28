class SigninModel {
  final bool status;
  final String message;
  final String token;
  final String profileImage;
  final int referencePoints;

  SigninModel({
    required this.status,
    required this.message,
    required this.token,
    required this.profileImage,
    required this.referencePoints,
  });

  factory SigninModel.fromJson(Map<String, dynamic> json) {
    return SigninModel(
      status: json['status'] as bool,
      message: json['message'] as String,
      token: json['token'] as String,
      profileImage: json['profile_image'] as String,
      referencePoints: json['reference_points'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'token': token,
      'profile_image': profileImage,
      'reference_points': referencePoints,
    };
  }
}
