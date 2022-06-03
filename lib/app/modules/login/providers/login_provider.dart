import 'package:alhaddad_driver/app/api/generic/base_model.dart';
import 'package:alhaddad_driver/app/api/services/api_client.dart';
import 'package:alhaddad_driver/app/modules/login/models/logout_response.dart';
import 'package:alhaddad_driver/app/modules/login/models/send_otp_params.dart';
import 'package:alhaddad_driver/app/modules/login/models/send_otp_response.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../api/error_handler/server_error.dart';

class LoginProvider extends GetConnect {
  late Dio dio;
  late ApiClient client;
  final AppStorageKeys appStorageKeys = AppStorageKeys();

  String baseurl = AppConstants.BaseUrl;
  String className = "LoginProvider";

  @override
  void onInit() {
    CustomLogger().print('OnInit', className: className, lineNumber: 24);
    dio = Dio();
    client = ApiClient(dio, baseurl);
  }

  Future<BaseModel<SendOtpResponse>> sendOtpResponse(
      {required SendOtpParams params}) async {
    onInit();
    SendOtpResponse response;
    try {
      response = await client.sendOtp(params);
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 47);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }

  Future<BaseModel<LogoutResponse>> logoutUser() async {
    LogoutResponse response;
    try {
      response = await client.logout();
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 47);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }
}
