import 'package:alhaddad_driver/app/widgets/views/loaders/model_progress_hud.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_loader_widget.dart';

class LoadingView extends StatelessWidget {
  const LoadingView(
      {Key? key,
      required this.isLoading,
      required this.child,
      this.isShowBackground = false,
      this.progressIndicator,
      this.backgroundColor})
      : super(key: key);

  final RxBool isLoading;
  final Widget child;
  final bool isShowBackground;

  final Widget? progressIndicator;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Obx(() => isLoading.value
        ? !isShowBackground
            ? const CustomLoaderWidget()
            : CustomModelProgressHud(
                asyncCall: isLoading.value,
                child: child,
                backgroundColor: backgroundColor,
                progressIndicator: progressIndicator,
              )
        : child);
  }
}
