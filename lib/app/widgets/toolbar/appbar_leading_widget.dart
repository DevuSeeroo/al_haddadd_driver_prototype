import 'package:flutter/material.dart';

import 'appbar_icon_button.dart';

class AppbarLeadingWidget extends StatelessWidget {
  const AppbarLeadingWidget({
    Key? key,
    required this.isHasNavDrawer,
    required this.isHasLeading,
    this.leading,
    this.onPressedLeading,
    this.leadingWidgetColor,
  }) : super(key: key);
  final bool isHasNavDrawer;
  final bool isHasLeading;
  final Widget? leading;
  final Function? onPressedLeading;
  final Color? leadingWidgetColor;
  @override
  Widget build(BuildContext context) {
    if (isHasNavDrawer) {
      return Builder(builder: (context) {
        return AppbarIconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
            // onPressedNavDrawer!();
          },
          icon: Icons.menu,
          color: leadingWidgetColor ?? Colors.black,
        );
      });
    } else {
      return isHasLeading
          ? leading ??
              AppbarIconButton(
                icon: Icons.arrow_back_ios,
                color: leadingWidgetColor,
                onPressed: () {
                  onPressedLeading!();
                },
              )
          : Container();
    }
  }
}
