import 'package:flutter/material.dart';

import '../../utils/app_color.dart';
import '../../utils/config.dart';

class TextFieldTitleWidget extends StatelessWidget {
  const TextFieldTitleWidget({
    Key? key,
    this.title,
    this.color,
  }) : super(key: key);

  final String? title;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? '',
      style: TextStyle(
        color: color ?? AppColor.textColor,
        fontWeight: FontWeight.w500,
        fontSize: Config.textSmallSize,
      ),
    );
  }
}
