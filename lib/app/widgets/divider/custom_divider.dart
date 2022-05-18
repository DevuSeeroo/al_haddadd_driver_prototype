import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
    this.topMargin = 0.0,
    this.bottomMargin = 0.0,
    this.height,
  }) : super(key: key);
  final double topMargin;
  final double bottomMargin;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topMargin),
        Container(
          height: height ?? 1,
          color: AppColor.dividerColor,
        ),
        SizedBox(height: bottomMargin),
      ],
    );
  }
}
