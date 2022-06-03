import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CustomModelProgressHud extends StatelessWidget {
  const CustomModelProgressHud(
      {required this.child,
      required this.asyncCall,
      this.progressIndicator,
      this.backgroundColor});

  final Widget child;
  final bool asyncCall;

  final Widget? progressIndicator;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      child: child,
      inAsyncCall: asyncCall,
      color: backgroundColor ?? Colors.grey,
      progressIndicator: progressIndicator ?? const CircularProgressIndicator(),
    );
  }
}
