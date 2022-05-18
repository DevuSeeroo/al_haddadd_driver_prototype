import 'package:flutter/material.dart';

import 'app_constants.dart';

class AppColor {
  static const Color colorPrimary = Color(0xFF095a78);
  static const Color colorPrimaryButton = Color(0xFF006496);
  static const Color colorAccent = Color(0xFFc8cf45);
  static const int primaryColorInt = 0xFF0364A4;
  static const Color textColor = Color(0xFF4b4545);
  static const Color colorShadow = Color(0xFFC8C8C8);
  static const Color colorBackground = Color(0xFFF7F8FC);
  static const Color colorOnPickedUpJob = colorPrimary;
  static const Color colorOnGoingJob = Color(0xFFecc714);
  static const Color colorOnReachedJob = Color(0xFF0d8756);
  static const Color hintTextColor = Color(0xFF88b7c3);
  static const Color searchBackgroundColor = Color(0xFFcedfe6);
  static const Color dividerColor = Color(0xFFc0d7e2);
  static const Color errorColor = Colors.redAccent;
  static const Color productListBackgroundColor = Color(0xFFd2e1e8);
  static const Color jobDetailBlueColor = Color(0xFF006496);
  static const Color jobDetailBorderColor = Color(0xFFafcfde);

  Color getJobBasedColor(int jobStatus) {
    return jobStatus == AppConstants.jobPickedUp
        ? AppColor.colorOnPickedUpJob
        : jobStatus == AppConstants.jobOnGoing
            ? AppColor.colorOnGoingJob
            : AppColor.colorOnReachedJob;
  }
}
