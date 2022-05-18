import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';

class ContentDetailsWidget extends StatelessWidget {
  const ContentDetailsWidget({
    Key? key,
    this.icon,
    required this.title,
    this.dividerSymbol,
    required this.value,
    this.valueColor,
    this.titleWeight,
    this.titleSize,
    this.valueWeight,
    this.valueSize,
    this.titleColor,
  }) : super(key: key);

  final IconData? icon;
  final String title;
  final Color? titleColor;
  final FontWeight? titleWeight;
  final double? titleSize;
  final String? dividerSymbol;
  final String value;
  final Color? valueColor;
  final FontWeight? valueWeight;
  final double? valueSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: AppColor.colorPrimary,
                        size: 16,
                      )
                    : const SizedBox(width: 16),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                        color: titleColor ?? Colors.black,
                        fontWeight: titleWeight ?? FontWeight.bold,
                        fontSize: titleSize ?? 16),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(dividerSymbol ?? ':'),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  color: valueColor,
                  fontWeight: valueWeight,
                  fontSize: valueSize),
            ),
          ),
        ],
      ),
    );
  }
}
