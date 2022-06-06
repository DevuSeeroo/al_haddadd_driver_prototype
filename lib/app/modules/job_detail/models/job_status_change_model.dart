class JobStatusChangeModel {
  int? statusCode;
  bool? status;
  String? message;

  JobStatusChangeModel({this.status, this.message, this.statusCode});

  JobStatusChangeModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status_code'] = statusCode;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
