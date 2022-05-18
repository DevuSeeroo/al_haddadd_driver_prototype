import 'package:flutter/material.dart';

class HeadingText extends StatelessWidget {
  const HeadingText(
      {Key? key, required this.text, this.textSize, this.textColor})
      : super(key: key);
  final String text;
  final double? textSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 2),
      child: Text(
        text,
        style: TextStyle(
            fontSize: textSize ?? 20,
            color: textColor ?? Colors.white,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
