import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';

class TabTitleText extends StatelessWidget {
  const TabTitleText({
    Key? key,
    required this.title,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String title;
  final bool isSelected;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Text(
            title,
            style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : null,
                color: isSelected ? AppColor.colorPrimary : null),
          )),
    );
  }
}
