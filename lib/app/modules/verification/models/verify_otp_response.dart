class VerifyOtpResponse {
  String? message;
  bool? status;
  String? token;

  VerifyOtpResponse({this.message, this.status});

  VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
    token = json['Token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['Status'] = status;
    data['Token'] = token;
    return data;
  }
}
