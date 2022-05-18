import 'package:flutter/material.dart';

class AppBarTitleWidget extends StatelessWidget {
  const AppBarTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      style: const TextStyle(color: Colors.white, fontSize: 18),
    );
  }
}
