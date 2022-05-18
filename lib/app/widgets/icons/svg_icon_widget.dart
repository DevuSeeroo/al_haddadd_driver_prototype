import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIconWidget extends StatelessWidget {
  final String assetUrl;
  final double? height;
  final double? width;
  final Color? color;
  final Function? onTap;

  const SvgIconWidget(
      {Key? key,
      required this.assetUrl,
      this.height,
      this.width,
      this.color,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: () {
        onTap!();
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: SvgPicture.asset(
        assetUrl,
        fit: BoxFit.fill,
        width: width ?? 14,
        height: height ?? 14,
        color: color,
      ),
    );
  }
}
