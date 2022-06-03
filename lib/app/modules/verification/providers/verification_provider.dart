import 'package:alhaddad_driver/app/api/generic/base_model.dart';
import 'package:alhaddad_driver/app/api/services/api_client.dart';
import 'package:alhaddad_driver/app/modules/verification/models/verify_otp_params.dart';
import 'package:alhaddad_driver/app/modules/verification/models/verify_otp_response.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../api/error_handler/server_error.dart';

class VerificationProvider extends GetConnect {
  late Dio dio;
  late ApiClient client;
  final AppStorageKeys appStorageKeys = AppStorageKeys();

  String baseurl = AppConstants.BaseUrl;
  String className = "VerificationProvider";

  @override
  void onInit() {
    CustomLogger().print('OnInit', className: className, lineNumber: 23);
    dio = Dio();
    client = ApiClient(dio, baseurl);
  }

  Future<BaseModel<VerifyOtpResponse>> verifyOtp(
      {required VerifyOtpParams params}) async {
    onInit();
    VerifyOtpResponse response;
    try {
      response = await client.verifyOtp(params);
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 35);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }
}
