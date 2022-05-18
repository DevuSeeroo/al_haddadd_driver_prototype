class ErrorListResponse {
  List<String>? errorList;

  ErrorListResponse({this.errorList});

  ErrorListResponse.fromJson(Map<String, dynamic> json) {
    errorList = json['error_list'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['error_list'] = errorList;
    return data;
  }
}
