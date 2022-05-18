import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:retrofit/http.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "")
abstract class ApiClient {
  factory ApiClient(Dio dio, String baseUrl) {
    dio.options = BaseOptions(
      receiveTimeout: 5000,
      connectTimeout: 5000,
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

  @POST("/api-frontend/AlHaddad/Register?returnUrl=/")
  Future<dynamic> registerData(
      @Header("Authorization") String header, @Body() dynamic inputData);

  // @POST("/api-frontend/Authenticate/GetToken")
  // Future<LoginResponse> login(
  //   @Field("is_guest") bool isGuest,
  //   @Field("username") String userName,
  //   @Field("email") String email,
  //   @Field("password") String password,
  // );

  // @GET("/api-frontend/AlHaddad/Logout")
  // Future<LogoutResponse> logout();

  // @GET('/api-frontend/Customer/CheckUsernameAvailability')
  // Future<UserNameAvailabilityResponse> checkUserName(
  //   @Query('username') String userName,
  // );

  // @GET("/api-frontend/AlHaddad/ProductReviews/{productId}")
  // Future<ProductReviewResponse> productReviewList(
  //   @Header("Authorization") String header,
  //   @Path("productId") int productId,
  // );

}
