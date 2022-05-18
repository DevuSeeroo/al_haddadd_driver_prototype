import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';

import 'container_with_border.dart';
import 'content_details_widget.dart';

class JobDetailWidget extends StatelessWidget {
  const JobDetailWidget({
    Key? key,
    required this.title,
    this.subTitle = "",
    required this.titleValue,
    this.subtitleValue = "",
    required this.iconsData,
    this.titleValueColor,
    this.subtitleValueColor,
    this.subtitleValueSize,
    this.titleValueSize,
    this.subtitleSize,
    this.subtitleValueFontWeight,
    this.titleValueFontWeight,
  }) : super(key: key);

  final String title;
  final IconData iconsData;
  final String subTitle;
  final String titleValue;
  final Color? titleValueColor;
  final double? titleValueSize;
  final double? subtitleSize;
  final String subtitleValue;
  final Color? subtitleValueColor;
  final double? subtitleValueSize;
  final FontWeight? subtitleValueFontWeight;
  final FontWeight? titleValueFontWeight;

  @override
  Widget build(BuildContext context) {
    return ContainerWithBorder(
      child: Column(
        children: [
          ContentDetailsWidget(
              icon: iconsData,
              title: title,
              value: titleValue,
              valueColor: titleValueColor,
              valueSize: titleValueSize,
              valueWeight: titleValueFontWeight),
          if (subTitle.isNotEmpty || subtitleValue.isNotEmpty)
            const SizedBox(height: 5),
          if (subTitle.isNotEmpty || subtitleValue.isNotEmpty)
            ContentDetailsWidget(
                title: subTitle,
                titleWeight: FontWeight.normal,
                titleColor: AppColor.textColor,
                titleSize: subtitleSize,
                dividerSymbol: "",
                value: subtitleValue,
                valueColor: subtitleValueColor,
                valueSize: subtitleValueSize,
                valueWeight: subtitleValueFontWeight),
        ],
      ),
    );
  }
}
