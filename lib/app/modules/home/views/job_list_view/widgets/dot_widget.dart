import 'package:flutter/material.dart';

import '../../../../../../generated/assets.dart';

class DotWidget extends StatelessWidget {
  const DotWidget({
    Key? key,
    required this.color,
  }) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Image.asset(Assets.iconsDeliveryOnGoingDot, color: color),
    );
  }
}
