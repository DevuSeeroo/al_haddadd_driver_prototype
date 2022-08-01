import 'package:alhaddad_driver/app/api/generic/base_model.dart';
import 'package:alhaddad_driver/app/api/services/api_client.dart';
import 'package:alhaddad_driver/app/modules/login/controllers/login_controller.dart';
import 'package:alhaddad_driver/app/modules/login/models/send_otp_params.dart';
import 'package:alhaddad_driver/app/modules/login/models/send_otp_response.dart';
import 'package:alhaddad_driver/app/modules/login/views/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
// import 'package:mockito/mockito.dart';
import 'package:mocktail/mocktail.dart';

// import 'login_test.mocks.dart';

class MockLoginClient extends Mock implements ApiClient {}

// @GenerateMocks([ApiClient])
void main() {
  final controller = LoginController();
  final client = MockLoginClient();

  setUp(() {
    Get.put(LoginController());
  });
  test("login validation", () {
    expect(controller.formKey.currentState?.validate(), true);
  });

  group("login_validation", () {
    test("mobile_number_validation", () {
      expect(controller.isMobileNumberValid("value"), null);
    });

    test("mobile_number_validation", () {
      expect(controller.isMobileNumberValid("1234"), null);
    });
  });

  testWidgets("Flutter Widget Test", (WidgetTester tester) async {
    String mobileNumber = "+966123456798";
    var inputModel = SendOtpParams(mobileNumber);
    var outputModel = SendOtpResponse(
      phoneNumber: mobileNumber,
      otp: "1234",
      processTypeId: 2,
      createdOnUTC: "2022-07-28T09:29:18"
          ".6296106Z",
      updatedOnUTC: "0001-01-01T00:00:00",
      expiryOnUTC: "2022-07-28T09:31:18.6296106Z",
      apiResponseModel: APIResponseModel(
        message: "OTP has been sent",
        value: 7812,
        status: true,
      ),
      isVerified: 0,
    );
    // when(client
    //     .sendOtp(inputModel)
    //     .then((value) => outputModel));
    when(
      () => client.sendOtp(inputModel),
    ).thenAnswer((_) async {
      return outputModel;
    });
    await tester.pumpWidget(const MaterialApp(home: LoginView()));
    var textField = find.byType(TextFormField);
    expect(textField, findsOneWidget);
    await tester.enterText(textField, mobileNumber);
    expect(find.text(mobileNumber), findsOneWidget);
    var button = find.byType(ElevatedButton);
    expect(button, findsOneWidget);
    await tester.tap(button);
    expect(controller.isMobileNumberValid(mobileNumber), null);
    await tester.pump();
  });

  test("api_test_implementation", () {
    String mobileNumber = "+966123456798";
    var inputModel = SendOtpParams(mobileNumber);
    var outputModel = SendOtpResponse(
      phoneNumber: mobileNumber,
      otp: "1234",
      processTypeId: 2,
      createdOnUTC: "2022-07-28T09:29:18"
          ".6296106Z",
      updatedOnUTC: "0001-01-01T00:00:00",
      expiryOnUTC: "2022-07-28T09:31:18.6296106Z",
      apiResponseModel: APIResponseModel(
        message: "OTP has been sent",
        value: 7812,
        status: true,
      ),
      isVerified: 0,
    );
    var res = outputFunction(outputModel);
    // var res = outputFunction1(outputModel);
    when(
      () => client.sendOtp(inputModel),
    ).thenAnswer((_) async {
      return outputModel;
    });
    // var mockAPIResponse = client.sendOtp(inputModel);
    var mockAPIResponse =
        controller.provider.sendOtpResponse(params: inputModel);
    expect(mockAPIResponse.toString(), res.toString());
  });
}

Future<BaseModel<SendOtpResponse>> outputFunction(
    SendOtpResponse outputModel) async {
  return BaseModel()..setData(outputModel);
}

Future<SendOtpResponse> outputFunction1(SendOtpResponse outputModel) async {
  return outputModel;
}
