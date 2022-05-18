import 'dart:io';

import 'package:alhaddad_driver/app/utils/snackbar_utils.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../generated/locales.g.dart';
import 'app_storage_keys.dart';

class Utilities {
  DateTime? currentBackPressTime;

  Future<bool> onBackPressed() {
    // SystemNavigator.pop();
    DateTime now = DateTime.now();
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
  List<TextInputFormatter>? nameFormatter = [
    FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]"))
  ];
  AppStorageKeys appStorageKeys = AppStorageKeys();

  navigationHeader(userEmail, number) {
    appStorageKeys.writeUserFullName(userEmail);
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
