class LogoutResponse {
  String? message;
  String? value;
  bool? status;
  String? token;
  String? errors;
  String? customProperties;

  LogoutResponse({message, value, status, token, errors, customProperties});

  LogoutResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    value = json['value'];
    status = json['status'];
    token = json['token'];
    errors = json['errors'];
    customProperties = json['custom_properties'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['value'] = value;
    data['status'] = status;
    data['token'] = token;
    data['errors'] = errors;
    data['custom_properties'] = customProperties;
    return data;
  }
}
