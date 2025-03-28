class SubmitQuizModel {
  bool? status;
  String? message;
  bool? isCorrect;
  int? points;

  SubmitQuizModel({this.status, this.message, this.isCorrect, this.points});

  SubmitQuizModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    isCorrect = json['is_correct'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['is_correct'] = isCorrect;
    data['points'] = points;
    return data;
  }
}
