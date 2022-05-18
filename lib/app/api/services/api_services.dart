import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:dio/dio.dart';

import '../../utils/app_storage_keys.dart';
import 'api_client.dart';

class ApiServices {
  late Dio dio;
  late ApiClient client;
  final AppStorageKeys appStorageKeys = AppStorageKeys();

  String baseUrl = AppConstants.BaseUrl;

  ApiServices({String? baseUrl}) {
    dio = Dio();
    client = ApiClient(dio, baseUrl ?? this.baseUrl);
  }

  // Future<BaseModel<RegisterResponse>> registerUser(
  //     RegisterInput inputData) async {
  //   RegisterResponse response;
  //   try {
  //     response = await client.registerData(
  //         "${appStorageKeys.readAdminToken()}", inputData);
  //     print('in services : ${appStorageKeys.readAdminToken()}');
  //   } catch (error, stacktrace) {
  //     print(stacktrace);
  //     return BaseModel()
  //       ..setException(ServerError.withErrorAndCode(error: error as DioError));
  //   }
  //   return BaseModel()..data = response;
  // }

}
