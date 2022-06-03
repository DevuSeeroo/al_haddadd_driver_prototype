class LogoutResponse {
  String? message;
  String? value;
  bool? status;
  String? token;
  String? errors;
  String? customProperties;

  LogoutResponse(
      {this.message,
      this.value,
      this.status,
      this.token,
      this.errors,
      this.customProperties});

  LogoutResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    value = json['value'];
    status = json['status'];
    token = json['token'];
    errors = json['errors'];
    customProperties = json['custom_properties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['value'] = this.value;
    data['status'] = this.status;
    data['token'] = this.token;
    data['errors'] = this.errors;
    data['custom_properties'] = this.customProperties;
    return data;
  }
}
