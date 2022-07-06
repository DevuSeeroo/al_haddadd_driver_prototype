import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;

class SecondRowItem extends StatelessWidget {
  const SecondRowItem({
    Key? key,
    required this.statusColor,
    required this.statusMessage,
    required this.time,
    // required this.date,
  }) : super(key: key);

  final Color statusColor;
  final String statusMessage;
  final String time;
  // final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image.asset(Assets.iconsDeliveryOnGoingTruck, color: statusColor),
        SvgPicture.asset(Assets.iconsDeliveryTruck, color: statusColor),
        if (statusMessage.isNotEmpty) const SizedBox(height: 5),
        if (statusMessage.isNotEmpty)
          Text(
            intl.toBeginningOfSentenceCase(statusMessage) ?? "",
            style: TextStyle(color: statusColor, fontSize: 16),
          ),
        if (time.isNotEmpty) const SizedBox(height: 5),
        if (time.isNotEmpty) Text(time),
        // if (date.isNotEmpty) const SizedBox(height: 5),
        // if (date.isNotEmpty) Text(date),
      ],
    );
  }
}
