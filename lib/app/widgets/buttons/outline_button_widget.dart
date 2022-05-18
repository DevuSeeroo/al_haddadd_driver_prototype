import 'package:alhaddad_driver/app/utils/themes_utils.dart';
import 'package:flutter/material.dart';

class OutlineButtonWidget extends StatelessWidget {
  final String title;
  final Color? titleColor;
  final Function onPressed;
  final Color? backgroundColor;
  final double? verticalPadding;
  final double? horizontalPadding;
  final bool showLoader;
  final EdgeInsetsGeometry? outerPadding;
  final double? width;
  final double? height;
  final double? radius;
  final ButtonStyle? style;
  const OutlineButtonWidget({
    Key? key,
    required this.title,
    required this.onPressed,
    this.backgroundColor,
    this.verticalPadding,
    this.horizontalPadding,
    this.showLoader = false,
    this.outerPadding,
    this.width,
    this.height,
    this.radius,
    this.titleColor,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: outerPadding,
      width: width,
      height: height,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        style: ThemeUtils().outlineButtonStyle(),
        child: showLoader
            ? buildProgress()
            : Text(
                title,
                style: TextStyle(
                    fontSize: 16,
                    color: titleColor ?? Colors.white,
                    fontWeight: FontWeight.w400),
              ),
      ),
    );
  }

  Center buildProgress() {
    return const Center(
      child: SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          strokeWidth: 2.0,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
