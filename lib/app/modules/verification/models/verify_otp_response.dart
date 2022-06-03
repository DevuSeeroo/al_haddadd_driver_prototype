class VerifyOtpResponse {
  String? message;
  bool? status;

  VerifyOtpResponse({this.message, this.status});

  VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Status'] = this.status;
    return data;
  }
}
