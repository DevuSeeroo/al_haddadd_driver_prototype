import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class BottomNavItem extends StatelessWidget {
  const BottomNavItem({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.isSelected = false,
  }) : super(key: key);

  final Function onPressed;
  final IconData icon;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onPressed();
        },
        child: Container(
          height: 40,
          width: 40,
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? AppColor.colorPrimaryButton : Colors.white),
          child: Icon(icon,
              color: isSelected ? Colors.white : Colors.black, size: 25),
        ),
      ),
    );
  }
}
