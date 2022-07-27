import 'dart:developer';

import 'package:dio/dio.dart' hide Headers;
import 'package:get/get.dart';

import '../../../generated/locales.g.dart';

class ServerError implements Exception {
  int? _errorCode = 0;

  // List<String?> _errorMessage = [];
  dynamic _errorMessage = "";

  ServerError(this._errorCode, this._errorMessage);

  ServerError.withErrorAndCode({required DioError error}) {
    _handleErrorAndCode(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    // return _errorMessage.join("");
    return _errorMessage;
  }

  _handleErrorAndCode(DioError error) {
    ServerError serverError;
    switch (error.type) {
      case DioErrorType.cancel:
        _errorCode = error.response!.statusCode;
        // _errorMessage.add("Request was cancelled");
        _errorMessage = LocaleKeys.cancelErrorMessage.tr;
        serverError = ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.connectTimeout:
        try {
          _errorCode = error.response!.statusCode;
        } catch (e) {
          _errorCode = 101;
        }
        // _errorMessage.add("Connection timeout");
        _errorMessage = LocaleKeys.timeoutErrorMessage.tr;
        serverError = ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.receiveTimeout:
        _errorCode = error.response?.statusCode;
        //_errorMessage.add("Receive timeout in connection");
        _errorMessage = LocaleKeys.connectionTimeoutErrorMessage.tr;
        serverError = ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.response:
        log('Response Type: ${DioErrorType.response}');
        _errorCode = error.response!.statusCode;
        if (error.response != null &&
            error.response!.statusMessage!.isNotEmpty) {
          try {
            _errorMessage = error.response!.data;
            if (_errorMessage.isEmpty) {
              _errorMessage =
                  "${LocaleKeys.somethingWentWrong.tr}! ${error.response!.statusCode}";
            }
          } catch (e) {
            _errorMessage = LocaleKeys.somethingWentWrong.tr;
            log('Response error message: $_errorMessage from ServerError line'
                ' number:67');
          }
        } else {
          _errorMessage =
              "${LocaleKeys.invalidStatusCodeErrorMessage.tr}: ${error.response!.statusCode}";
        }
        serverError = ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.sendTimeout:
        _errorCode = error.response!.statusCode;
        _errorMessage = LocaleKeys.invalidStatusErrorMessage.tr;
        serverError = ServerError(_errorCode, _errorMessage);
        break;
      case DioErrorType.other:
        _errorCode = 100;
        _errorMessage = LocaleKeys.noConnectionErrorMessage.tr;
        serverError = ServerError(_errorCode, _errorMessage);
        break;
      default:
        _errorCode = error.response!.statusCode;
        _errorMessage = error.response!.statusMessage ?? "";
        serverError = ServerError(_errorCode, _errorMessage);
        break;
    }
    return serverError;
  }
}
