import 'package:flutter/material.dart';

class AppbarIconButton extends StatelessWidget {
  const AppbarIconButton({
    Key? key,
    required this.onPressed,
    required this.icon,
    this.color,
    this.iconSize,
  }) : super(key: key);

  final Function? onPressed;
  final IconData? icon;
  final Color? color;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        onPressed!();
      },
      icon: Icon(
        icon ?? Icons.shopping_cart_outlined,
        color: color ?? Colors.white,
        size: iconSize ?? 20,
      ),
    );
  }
}
