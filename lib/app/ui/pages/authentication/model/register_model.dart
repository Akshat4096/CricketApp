class SignUpModel {
  final bool status;
  final String message;
  final String token;

  SignUpModel({
    required this.status,
    required this.message,
    required this.token,
  });

  factory SignUpModel.fromJson(Map<String, dynamic> json) {
    return SignUpModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'token': token,
    };
  }
}
