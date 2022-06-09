import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({required this.isChecked, required this.onTap});

  final bool isChecked;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
      ),
      child: isChecked
          ? IconButton(
              icon: SvgPicture.asset(
                Assets.iconsRectangleTick,
              ),
              onPressed: () {
                onTap();
              },
            )
          : IconButton(
              icon: SvgPicture.asset(
                Assets.iconsRectangle,
              ),
              onPressed: () {
                onTap();
              },
            ),
    );
  }
}
