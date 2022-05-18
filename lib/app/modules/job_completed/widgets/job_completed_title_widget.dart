import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobCompletedTitleWidget extends StatelessWidget {
  const JobCompletedTitleWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        LocaleKeys.congratulations.tr,
        style: const TextStyle(
            color: AppColor.colorPrimaryButton,
            fontSize: 20,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
