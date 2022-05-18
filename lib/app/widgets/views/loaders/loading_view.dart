import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_loader_widget.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({Key? key, required this.isLoading, required this.child})
      : super(key: key);

  final RxBool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Obx(() => isLoading.value ? const CustomLoaderWidget() : child);
  }
}
