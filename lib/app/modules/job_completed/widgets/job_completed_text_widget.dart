import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobCompletedTextWidget extends StatelessWidget {
  const JobCompletedTextWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.jobCompletedSuccessfully.tr,
        style: const TextStyle(
          fontSize: 18,
        ),
      ),
    );
  }
}
