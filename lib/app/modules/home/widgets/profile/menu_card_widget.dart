import 'package:alhaddad_driver/app/modules/home/controllers/profile_controller.dart';
import 'package:alhaddad_driver/app/modules/home/widgets/profile/profile_item_widget.dart';
import 'package:alhaddad_driver/app/widgets/divider/custom_divider.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuCardWidget extends StatelessWidget {
  const MenuCardWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: controller.name.value.length >= 50 ? 50.0 : 25.0),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ProfileItemWidget(
              assetUrl: Assets.iconsHistory,
              title: LocaleKeys.logout.tr,
              onTap: () {
                controller.logout();
              },
            ),
            const CustomDivider(
              bottomMargin: 20,
            ),
          ],
        ),
      ),
    );
  }
}
