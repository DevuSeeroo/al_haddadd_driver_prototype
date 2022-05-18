import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:alhaddad_driver/app/widgets/buttons/solid_button_widget.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobCompletedButtonView extends StatelessWidget {
  const JobCompletedButtonView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SolidButton(
        horizontalPadding: 30,
        title: LocaleKeys.continueText.tr,
        onPressed: () {
          NavigationUtils().callHome();
        });
  }
}
