import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';

import '../../generated/locales.g.dart';
import '../api/error_handler/error_bad_request_resposne_model.dart';
import '../api/error_handler/error_list_response.dart';
import '../api/error_handler/error_model_response.dart';
import '../api/error_handler/server_error.dart';
import 'snackbar_utils.dart';

class ApiExceptionUtils {
  /// Function added to show snack bar with part of the error and print the
  /// full error in log to from where the error occurred
  void apiException(
      {required ServerError error,
      required String className,
      String calledFrom = '',
      required lineNumber}) {
    log('ApiExceptionUtils: ${error.getErrorMessage()}');

    CustomSnackBar.showErrorSnackBar(
        LocaleKeys.error.tr, generateErrorMessage(error),
        className: className, calledFrom: calledFrom, lineNumber: lineNumber);
  }

  generateErrorMessage(ServerError error) {
    dynamic errorData = error.getErrorMessage();
    try {
      ///For String List type of error
      ///[
      ///   "Product can be reviewed only after purchasing it"
      ///]
      try {
        var jsonString = "{\"error_list\": ${jsonEncode(errorData)}}";
        var list = ErrorListResponse.fromJson(jsonDecode(jsonString));
        return (list.errorList ?? []).first;
      } catch (e) {
        log('generateErrorMessage: list error: $e');
      }

      ///For Object type of error
      ///{
      ///     "message": "إسم المستخدم او كلمة المرور غير صحيحين",
      ///     "inner_exception_message": null,
      ///     "stack_trace": "Nop.Core.NopException: إسم المستخدم او كلمة المرور غير صحيحين\r\n
      /// }
      try {
        ErrorModelResponse response = ErrorModelResponse.fromJson(errorData);
        return response.message;
      } catch (e) {
        log('generateErrorMessage: object error: $e');
      }

      ///For 400 bad request type of error
      ///{
      ///     type: "https://tools.ietf.org/html/rfc7231#section-6.5.1",
      ///     title: "Bad Request",
      ///     status: 400,
      ///     traceId: "00-4b61812d5c9c9849a5cd22f0302989fb-532a7177ff828d4e-00"
      ///}
      try {
        ErrorBadRequestResposneModel response =
            ErrorBadRequestResposneModel.fromJson(errorData);
        return response.title;
      } catch (e) {
        log('generateErrorMessage: object error: $e');
      }

      ///For String type of error
      ///"Product id=5302 not found or does not meet the required criteria."
      try {
        String errorMessage = errorData as String;
        return errorMessage;
      } catch (e) {
        log('generateErrorMessage: string error: $e');
      }
      return somethingWentWong(lineNumber: 60);
    } catch (e) {
      return somethingWentWong(lineNumber: 62);
    }
  }

  String somethingWentWong({required int lineNumber}) {
    log("ApiExceptionUtils: from line number: $lineNumber");
    return LocaleKeys.somethingWentWrong.tr;
  }
}
