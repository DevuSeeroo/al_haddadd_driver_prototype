import 'dart:developer';

class CustomLogger {
  void print(
    String message, {
    String? className,
    required int lineNumber,
    Object? error,
    StackTrace? stackTrace,
  }) {
    log("Message: $message, className: $className, lineNumber: $lineNumber",
        error: error,
        stackTrace: stackTrace,
        name: className ?? "CustomLogger");
  }
}
