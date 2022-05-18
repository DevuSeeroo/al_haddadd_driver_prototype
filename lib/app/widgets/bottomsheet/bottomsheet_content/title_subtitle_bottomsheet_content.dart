import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/themes_utils.dart';
import 'package:alhaddad_driver/app/widgets/buttons/outline_button_widget.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../buttons/solid_button_widget.dart';

class TitleSubtitleBottomSheetContent extends StatelessWidget {
  final String title;
  final String subtitle;
  final double subtitleHeight;
  final String? positiveButtonTitle;
  final String? negativeButtonTitle;
  final Function? positiveButtonPressed;
  final Function? negativeButtonPressed;
  final bool showPositiveButton;
  final bool showNegativeButton;

  const TitleSubtitleBottomSheetContent({
    Key? key,
    required this.title,
    required this.subtitle,
    this.positiveButtonTitle,
    this.negativeButtonTitle,
    this.positiveButtonPressed,
    this.negativeButtonPressed,
    this.showPositiveButton = true,
    this.showNegativeButton = true,
    this.subtitleHeight = 1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: Icon(Icons.close),
                  ))
            ],
          ),
          const Divider(thickness: 1),
          Text(subtitle,
              // overflow: TextOverflow.ellipsis,
              maxLines: null,
              softWrap: true,
              style: TextStyle(fontSize: 16, height: subtitleHeight)),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              if (showNegativeButton)
                Expanded(
                  child: OutlineButtonWidget(
                      style: ThemeUtils()
                          .buttonThemeSettings(
                            backgroundColor: Colors.white,
                          )
                          .style,
                      title: negativeButtonTitle ?? LocaleKeys.no.tr,
                      titleColor: AppColor.colorPrimaryButton,
                      onPressed: () {
                        negativeButtonPressed!();
                      }),
                ),
              if (showNegativeButton) const SizedBox(width: 20.0),
              if (showPositiveButton)
                Expanded(
                  child: SolidButton(
                      title: positiveButtonTitle ?? LocaleKeys.yes.tr,
                      onPressed: () {
                        positiveButtonPressed!();
                      }),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
