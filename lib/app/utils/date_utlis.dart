import 'package:intl/intl.dart';

class CustomDateUtils {
  CustomDateUtils();
  String dateTimeUtcFormat = "y-MM-ddTHH:mm:ss";

  int compareTwoDates({DateTime? firstDate, DateTime? secondDate}) {
    if (firstDate == null) firstDate = DateTime.now();
    if (secondDate == null) secondDate = DateTime.now();

    /// greater date
    if (firstDate.compareTo(secondDate) > 0) {
      print('${firstDate.toString()} greater ${secondDate.toString()}');
      return 1;
    }

    /// lesser date
    else if (firstDate.compareTo(secondDate) < 0) {
      print('${firstDate.toString()} lesser ${secondDate.toString()}');
      return -1;
    }

    /// equal date
    else {
      print('${firstDate.toString()} equal to ${secondDate.toString()}');
      return 0;
    }
  }

  DateTime convertStringToDate(
      {required String date, String? currentFormatPassed}) {
    // String currentFormat = "dd MMMM yyyy hh:mm aa";
    String currentFormat1 = dateTimeUtcFormat;
    // String currentFormat2 = "hh:mm aaa";
    print("Passed Date: '$date'");
    DateTime convertedDate =
        DateFormat(currentFormatPassed ?? currentFormat1).parse(date);
    print("Converted Date: ${convertedDate.toString()}");
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
      print('DateFormat Exception $e');
      return "";
    }
  }
}
