import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../generated/locales.g.dart';
import '../../../../../utils/app_color.dart';

class FirstRowItem extends StatelessWidget {
  const FirstRowItem({
    Key? key,
    required this.jobId,
    required this.name,
    required this.address,
  }) : super(key: key);

  final String jobId;
  final String name;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: LocaleKeys.jobId.tr,
              style: const TextStyle(
                color: AppColor.colorPrimary,
                fontSize: 15,
              ),
              children: <InlineSpan>[
                const WidgetSpan(child: SizedBox(width: 10)),
                TextSpan(
                    text: jobId,
                    style: const TextStyle(
                        color: AppColor.colorPrimary,
                        fontSize: 17,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Text(
            address.replaceAll(", ", ",\n").replaceAll(". ", ".\n"),
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
