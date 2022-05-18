import 'package:flutter/material.dart';

class ToolbarJobDetailsWidget extends StatelessWidget {
  const ToolbarJobDetailsWidget({
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
  }) : super(key: key);

  final IconData? icon;
  final String title;
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
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        color: Colors.white,
                      )
                    : const SizedBox(width: 24),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: titleWeight,
                      fontSize: titleSize),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              dividerSymbol ?? ':',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  color: valueColor ?? Colors.white,
                  fontWeight: valueWeight,
                  fontSize: valueSize),
            ),
          ),
        ],
      ),
    );
  }
}
