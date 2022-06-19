import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class CustomDateUtils {
  CustomDateUtils();
  String dateTimeUtcFormat = "y-MM-ddTHH:mm:ss";

  int compareTwoDates({DateTime? firstDate, DateTime? secondDate}) {
    firstDate ??= DateTime.now();
    secondDate ??= DateTime.now();

    /// greater date
    if (firstDate.compareTo(secondDate) > 0) {
      if (kDebugMode) {
        print('${firstDate.toString()} greater ${secondDate.toString()}');
      }
      return 1;
    }

    /// lesser date
    else if (firstDate.compareTo(secondDate) < 0) {
      if (kDebugMode) {
        print('${firstDate.toString()} lesser ${secondDate.toString()}');
      }
      return -1;
    }

    /// equal date
    else {
      if (kDebugMode) {
        print('${firstDate.toString()} equal to ${secondDate.toString()}');
      }
      return 0;
    }
  }

  DateTime convertStringToDate(
      {required String date, String? currentFormatPassed}) {
    // String currentFormat = "dd MMMM yyyy hh:mm aa";
    String currentFormat1 = dateTimeUtcFormat;
    // String currentFormat2 = "hh:mm aaa";
    if (kDebugMode) {
      print("Passed Date: '$date'");
    }
    DateTime convertedDate =
        DateFormat(currentFormatPassed ?? currentFormat1).parse(date);
    if (kDebugMode) {
      print("Converted Date: ${convertedDate.toString()}");
    }
    return convertedDate;
  }

  String dateToDisplay(
      {required String apiDate,
      String? currentDateFormat,
      String? neededDateFormat}) {
    try {
      var formattedDate =
          DateFormat(currentDateFormat ?? dateTimeUtcFormat).parse(apiDate);
      String formattedDob =
          DateFormat(neededDateFormat ?? "dd MMM yyy").format(formattedDate);
      return formattedDob;
    } catch (e) {
      if (kDebugMode) {
        print('DateFormat Exception $e');
      }
      return "";
    }
  }

  String convertDateToString(
      {required DateTime date,
      required String currentFormat,
      required String neededFormat}) {
    String convertedDate;
    try {
      convertedDate = DateFormat(neededFormat).format(date);
      CustomLogger().print("Date converted: $convertedDate",
          className: "CustomDateUtils", lineNumber: 67);
      return convertedDate;
    } catch (e) {
      CustomLogger()
          .printError(className: "CustomDateUtils", error: e, lineNumber: 71);
      return "";
    }
  }
}
