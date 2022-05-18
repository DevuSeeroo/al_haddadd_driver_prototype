import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/material.dart';

class BrokenImage extends StatelessWidget {
  final double? width;

  final double? height;

  final bool isShowAppIcon;
  final IconData? icon;

  const BrokenImage(
      {Key? key, this.width, this.height, this.isShowAppIcon = true, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[300],
      alignment: Alignment.center,
      child: SizedBox(
        width: width ?? 25.0,
        height: height ?? 25.0,
        child: isShowAppIcon ? buildImage() : buildIcon(),
      ),
    );
  }

  Icon buildIcon() =>
      icon == null ? const Icon(Icons.image_not_supported) : Icon(icon);

  Image buildImage() => Image.asset(
        Assets.iconsLogoIcon,
      );
}
