import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' as intl;

import '../../../../../generated/assets.dart';

class SecondRowItem extends StatelessWidget {
  const SecondRowItem({
    Key? key,
    required this.statusColor,
    required this.statusMessage,
    required this.time,
    required this.date,
  }) : super(key: key);

  final Color statusColor;
  final String statusMessage;
  final String time;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.asset(Assets.iconsDeliveryOnGoingTruck, color: statusColor),
        SvgPicture.asset(Assets.iconsDeliveryTruck, color: statusColor),
        const SizedBox(height: 5),
        Text(
          intl.toBeginningOfSentenceCase(statusMessage) ?? "",
          style: TextStyle(color: statusColor, fontSize: 16),
        ),
        const SizedBox(height: 5),
        Text(time),
        const SizedBox(height: 5),
        Text(date),
      ],
    );
  }
}
