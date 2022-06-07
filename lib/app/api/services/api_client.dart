import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart';
import 'package:alhaddad_driver/app/modules/home/models/view_profile_response.dart';
import 'package:alhaddad_driver/app/modules/job_detail/models/job_detail_model.dart';
import 'package:alhaddad_driver/app/modules/login/models/send_otp_params.dart';
import 'package:alhaddad_driver/app/modules/login/models/send_otp_response.dart';
import 'package:alhaddad_driver/app/modules/verification/models/verify_otp_params.dart';
import 'package:alhaddad_driver/app/modules/verification/models/verify_otp_response.dart';
import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

import '../../modules/login/models/logout_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "")
abstract class ApiClient {
  factory ApiClient(Dio dio, String baseUrl) {
    dio.options = BaseOptions(
      receiveTimeout: 10000,
      connectTimeout: 10000,
    );

    dio.interceptors.add(PrettyDioLogger(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 200));

    return _ApiClient(dio, baseUrl: baseUrl);
  }

  @GET("/api-frontend/AlHaddad/Logout")
  Future<LogoutResponse> logout();

  @POST("/api-frontend/AlHaddad/SendOtp")
  Future<SendOtpResponse> sendOtp(@Body() SendOtpParams sendOtpParams);

  @POST("/api-frontend/AlHaddad/VerifyOtp")
  Future<VerifyOtpResponse> verifyOtp(@Body() VerifyOtpParams sendOtpParams);

  @GET('/api-frontend/Customer/Info')
  Future<ViewProfileResponse> viewProfile(
      @Header('Authorization') String userToken);

  @GET("/api-frontend/AlHaddad/GetOrderDtlsDriver")
  Future<dynamic> getJobList(@Header("Authorization") String header,
      @Body() JobListInputParam inputParams);

  @POST("/api-frontend/AlHaddad/GetOrderDtlsDriver")
  Future<dynamic> getJobListPOST(@Header("Authorization") String header,
      @Body() JobListInputParam inputParams);

  @GET("/api-frontend/AlHaddad/DriverOrderDetails/{orderId}")
  Future<JobDetail> getJobDetail(
      @Header("Authorization") String header, @Path("orderId") String orderId);

  @POST("/api-frontend/AlHaddad/ShippedOrPicked")
  Future<dynamic> changeStatus(
      @Header("Authorization") String header, @Query("orderId") int orderId);
}
