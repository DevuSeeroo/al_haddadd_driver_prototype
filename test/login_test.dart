import 'package:alhaddad_driver/app/modules/login/controllers/login_controller.dart';
import 'package:flutter_test/flutter_test.dart';

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
}
