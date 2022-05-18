import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';

class ContainerWithBorder extends StatelessWidget {
  const ContainerWithBorder({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColor.jobDetailBorderColor,
          width: 1,
        ),
      ),
      child: child,
    );
  }
}
