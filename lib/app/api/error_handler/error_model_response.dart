class ErrorModelResponse {
  String? message;
  String? innerExceptionMessage;
  String? stackTrace;

  ErrorModelResponse(
      {this.message, this.innerExceptionMessage, this.stackTrace});

  ErrorModelResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    innerExceptionMessage = json['inner_exception_message'];
    stackTrace = json['stack_trace'];
    if ((message == null || message!.isEmpty) &&
        (innerExceptionMessage == null || innerExceptionMessage!.isEmpty) &&
        (stackTrace == null || stackTrace!.isEmpty)) {
      throw Exception();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['inner_exception_message'] = innerExceptionMessage;
    data['stack_trace'] = stackTrace;
    return data;
  }
}
