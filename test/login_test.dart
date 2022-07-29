import 'package:alhaddad_driver/app/api/services/api_client.dart';
import 'package:alhaddad_driver/app/modules/login/controllers/login_controller.dart';
import 'package:alhaddad_driver/app/modules/login/models/send_otp_params.dart';
import 'package:alhaddad_driver/app/modules/login/models/send_otp_response.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';

import 'login_test.mocks.dart';
// import 'package:mocktail/mocktail.dart';

// class MockLoginClient extends Mock implements ApiClient {}
@GenerateMocks([ApiClient])
void main() {
  final login = LoginController();

  test("login validation", () {
    expect(login.formKey.currentState?.validate(), true);
  });

  group("login_validation", () {
    test("mobile_number_validation", () {
      expect(login.isMobileNumberValid("value"), null);
    });

    test("mobile_number_validation", () {
      expect(login.isMobileNumberValid("1234"), null);
    });
  });

  test("api_test_implementation", () {
    String phoneNumber = "+966123456798";
    final client = MockApiClient();

    client
        .sendOtp(SendOtpParams(phoneNumber))
        .whenComplete(() => SendOtpResponse(
              phoneNumber: phoneNumber,
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
            ));
  });
}
