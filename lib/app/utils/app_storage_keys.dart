import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:get_storage/get_storage.dart';

class AppStorageKeys {
  final _isLoggedIn = 'is_logged_in';
  final _userName = 'user_name';
  final _userEmail = 'user_email';
  final _userId = 'user_id';
  final _userToken = 'user_token';
  final englishLanguageCode = 'english_id';
  final arabicLanguageCode = 'arabic_id';
  final lastLanguageCode = 'last_language_code';

  void writeLogInStatus(bool? isLoggedInStatus) {
    GetStorage().write(_isLoggedIn, isLoggedInStatus ?? false);
  }

  bool readLogInStatus() {
    return GetStorage().read(_isLoggedIn) ?? false;
  }

  void writeUserId(int? id) {
    GetStorage().write(_userId, id);
  }

  int? readUserId() {
    if (GetStorage().read(_userId).toString().isEmpty) {
      return null;
    } else {
      return GetStorage().read(_userId);
    }
  }

  void writeUserName(String? name) {
    GetStorage().write(_userName, name);
  }

  String? readUserName() {
    return GetStorage().read(_userName);
  }

  void writeUserFullName(String? email) {
    GetStorage().write(_userEmail, email);
  }

  String? readUserFullName() {
    return GetStorage().read(_userEmail);
  }

  void writeUserToken(String? token) {
    if (token == null) {
      GetStorage().write(_userToken, '');
    } else {
      GetStorage().write(_userToken, "Bearer $token");
    }
    CustomLogger().print("Write token: ${readUserToken()}", lineNumber: 56);
  }

  String readUserToken() {
    return GetStorage().read(_userToken) ?? "";
  }

  void clearAllDetails() {
    writeLogInStatus(null);
    writeUserId(null);
    writeUserName(null);
    writeUserToken(null);
    writeUserFullName(null);
  }
}
