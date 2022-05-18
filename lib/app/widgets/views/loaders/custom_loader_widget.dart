import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';

class CustomLoaderWidget extends StatelessWidget {
  const CustomLoaderWidget({
    Key? key,
    this.width,
    this.height,
    this.isExpanded = false,
  }) : super(key: key);

  final double? width;
  final double? height;
  final bool isExpanded;
  @override
  Widget build(BuildContext context) {
    if (isExpanded) {
      return Expanded(child: buildCustomLoaderWidgetContent());
    } else {
      return buildCustomLoaderWidgetContent();
    }
  }

  Widget buildCustomLoaderWidgetContent() => Container(
        width: width ?? Get.size.width,
        height: height ?? Get.size.height,
        color: Colors.white,
        alignment: Alignment.center,
        child: const SpinKitCircle(
          color: AppColor.colorPrimary,
        ),
      );
}
