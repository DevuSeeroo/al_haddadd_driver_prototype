import 'package:alhaddad_driver/app/api/error_handler/server_error.dart';
import 'package:alhaddad_driver/app/api/generic/base_model.dart';
import 'package:alhaddad_driver/app/api/services/api_client.dart';
import 'package:alhaddad_driver/app/modules/home/models/view_profile_response.dart';
import 'package:alhaddad_driver/app/modules/login/models/logout_response.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/app_storage_keys.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileProvider extends GetConnect {
  late Dio dio;
  late ApiClient client;
  final AppStorageKeys appStorageKeys = AppStorageKeys();

  String baseurl = AppConstants.BaseUrl;
  String className = "ProfileProvider";
  @override
  void onInit() {
    CustomLogger().print('OnInit', className: className, lineNumber: 20);
    dio = Dio();
    client = ApiClient(dio, baseurl);
  }

  Future<BaseModel<ViewProfileResponse>> viewProfileData() async {
    onInit();
    ViewProfileResponse viewProfileResponse;
    try {
      viewProfileResponse =
          await client.viewProfile(AppStorageKeys().readUserToken());
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 33);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = viewProfileResponse;
  }

  Future<BaseModel<LogoutResponse>> logoutUser() async {
    onInit();
    LogoutResponse response;
    try {
      response = await client.logout();
    } catch (error, stacktrace) {
      CustomLogger()
          .printError(error: error, stackTrace: stacktrace, lineNumber: 32);
      return BaseModel()
        ..setException(ServerError.withErrorAndCode(error: error as DioError));
    }
    return BaseModel()..data = response;
  }
}
