import 'package:alhaddad_driver/app/widgets/toolbar/app_bar_title_widget.dart';
import 'package:alhaddad_driver/app/widgets/toolbar/appbar_icon_button.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class CustomContainerToolbar extends StatelessWidget {
  const CustomContainerToolbar(
      {Key? key,
      this.showCustomBackgroundImage = false,
      this.isHasLeading = true,
      this.leadingIcon,
      this.leadingWidgetColor,
      this.onPressedLeading,
      this.title,
      this.isHasTrailing = false,
      this.trailingIcon,
      this.trailingWidgetColor,
      this.onPressedTrailing,
      this.isTrailingSvg = false})
      : super(key: key);
  final bool showCustomBackgroundImage;
  final bool isHasLeading;
  final IconData? leadingIcon;
  final Color? leadingWidgetColor;
  final Function? onPressedLeading;
  final String? title;

  final bool isHasTrailing;
  final bool isTrailingSvg;
  final dynamic trailingIcon;
  final Color? trailingWidgetColor;
  final Function? onPressedTrailing;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kToolbarHeight + (Get.statusBarHeight / 2),
      decoration: showCustomBackgroundImage
          ? const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(Assets.imagesAppbarBackground),
                fit: BoxFit.cover,
              ),
            )
          : null,
      child: Column(
        children: [
          SizedBox(height: Get.statusBarHeight / 2),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (isHasLeading)
                  AppbarIconButton(
                    onPressed: () {
                      onPressedLeading!();
                    },
                    icon: leadingIcon ?? Icons.arrow_back_ios,
                    color: leadingWidgetColor ?? Colors.white,
                  ),
                Expanded(
                    child: Center(
                  child: AppBarTitleWidget(
                    title: title ?? "",
                  ),
                )),
                if (isHasTrailing && !isTrailingSvg)
                  IconButton(
                      onPressed: () {
                        onPressedTrailing!();
                      },
                      icon: Icon(
                        trailingIcon,
                        color: trailingWidgetColor,
                      )),
                if (isHasTrailing && isTrailingSvg)
                  IconButton(
                      onPressed: () {
                        onPressedTrailing!();
                      },
                      icon: SvgPicture.asset(
                        trailingIcon,
                        color: trailingWidgetColor,
                      ),
                      iconSize: 40),
                //given just to make title in center
                if (isHasLeading && !isHasTrailing) const EmptyIconView()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyIconView extends StatelessWidget {
  const EmptyIconView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.message,
          color: Colors.transparent,
        ));
  }
}
