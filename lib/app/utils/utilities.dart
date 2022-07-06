import 'dart:io';

import 'package:alhaddad_driver/app/utils/snackbar_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../generated/locales.g.dart';
import 'app_storage_keys.dart';

class Utilities {
  static DateTime? currentBackPressTime;

  Future<bool> onBackPressed() {
    // SystemNavigator.pop();
    DateTime now = DateTime.now();
    print("currentBackPressTime: $currentBackPressTime");
    print(
        "Difference: ${now.difference(currentBackPressTime ?? DateTime.now()) > const Duration(seconds: 2)}");
    print(
        "Condition: ${currentBackPressTime == null || now.difference(currentBackPressTime!) > const Duration(seconds: 2)}");
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      CustomSnackBar.showIncompleteSnackBar(
          LocaleKeys.titleAlHaddad.tr, LocaleKeys.pressAgainToExit.tr);
      return Future.value(false);
    }
    if (Platform.isAndroid) {
      SystemNavigator.pop();
    }
    return Future.value(true);
  }

  List<TextInputFormatter>? numberFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[0-9]"))
  ];

  List<TextInputFormatter>? phnNumberFormatter = [
    FilteringTextInputFormatter.allow(RegExp('[+0-9]')),
    LengthLimitingTextInputFormatter(13),
  ];

  List<TextInputFormatter>? nameFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
  ];
  AppStorageKeys appStorageKeys = AppStorageKeys();

  navigationHeader(userEmail, number) {
    appStorageKeys.writeUserFullName(userEmail);
  }

  int get lineNumber {
    // Frame #1 is our caller.
    //
    // Example line to parse:
    // #1      someFunction (package:somePackage/someFile.dart:123:45)
    final re =
        RegExp(r'^#1[ \t]+.+:(?<line>[0-9]+):[0-9]+\)$', multiLine: true);
    final match = re.firstMatch(StackTrace.current.toString());
    if ((match == null)) {
      return -1;
    } else {
      return int.parse(match.namedGroup('line') ?? "0");
    }
  }

  launchPhoneURL(String phoneNumber) async {
    String url = 'tel:' + phoneNumber;
    if (await canLaunchUrlString(url)) {
      await launchPhoneURL(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
