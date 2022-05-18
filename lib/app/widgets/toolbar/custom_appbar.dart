import 'package:flutter/material.dart';

import '../../../generated/assets.dart';
import '../../utils/app_color.dart';
import 'app_bar_title_widget.dart';
import 'appbar_icon_button.dart';
import 'appbar_leading_widget.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String? from;
  final Color? backgroundColor;
  final String? strTitle;
  final Widget? titleWidget;
  final bool? centerTitle;
  final bool showCustomBackgroundImage;
  final bool isHasLeading;
  final Widget? leading;
  final Color? leadingWidgetColor;
  final Function? onPressedLeading;
  final bool? isDefaultBackPress;
  final bool isHasNavDrawer;
  final Function? onPressedNavDrawer;
  final bool isHasEditIcon;
  final Function? onPressedEdit;
  final bool isHasNotification;
  final Function? onPressedNotification;
  final bool isHasClearText;
  final Function? onClearPressed;
  final bool isHasCart;
  final bool isHasShareButton;
  final Function? onShareOption;
  final Function? onPressedCart;
  final bool isHasCustomIcon;
  final Widget? customIconWidget;
  final Function? onPressedCustomIcon;
  final bool isHasCompareButton;
  final Function? onCompareClick;

  const CustomAppbar({
    Key? key,
    this.from,
    this.strTitle,
    this.centerTitle,
    this.leading,
    this.isHasNavDrawer = false,
    this.isHasLeading = true,
    this.onPressedLeading,
    this.titleWidget,
    this.onPressedNavDrawer,
    this.isHasEditIcon = false,
    this.onPressedEdit,
    this.isHasNotification = false,
    this.onPressedNotification,
    this.isHasClearText = false,
    this.onClearPressed,
    this.isHasShareButton = false,
    this.onShareOption,
    this.onPressedCart,
    this.isHasCart = false,
    this.isHasCustomIcon = false,
    this.onPressedCustomIcon,
    this.customIconWidget,
    this.isDefaultBackPress = true,
    this.isHasCompareButton = false,
    this.onCompareClick,
    this.backgroundColor,
    this.leadingWidgetColor,
    this.showCustomBackgroundImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor ?? AppColor.colorPrimary,
      flexibleSpace: showCustomBackgroundImage
          ? Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(Assets.imagesAppbarBackground),
                  fit: BoxFit.cover,
                ),
              ),
            )
          : null,
      elevation: 0.0,
      centerTitle: centerTitle ?? false,
      titleSpacing: 0.0,
      title: titleWidget ??
          (strTitle != null ? AppBarTitleWidget(title: strTitle) : null),
      leading: AppbarLeadingWidget(
        isHasLeading: isHasLeading,
        isHasNavDrawer: isHasNavDrawer,
        leading: leading,
        onPressedLeading: onPressedLeading,
        leadingWidgetColor: leadingWidgetColor,
      ),
      actions: [
        isHasShareButton
            ? AppbarIconButton(
                onPressed: onShareOption,
                icon: Icons.share,
                color: Colors.white)
            : Container(),
        isHasCompareButton
            ? AppbarIconButton(
                onPressed: onCompareClick,
                icon: Icons.compare_arrows_outlined,
                color: Colors.white,
              )
            : Container(),
        isHasNotification
            ? AppbarIconButton(
                onPressed: onPressedNotification,
                icon: Icons.notifications,
                color: Colors.black,
              )
            : Container(),
        isHasEditIcon
            ? AppbarIconButton(
                onPressed: onPressedEdit,
                color: Colors.black,
                icon: Icons.edit,
              )
            : Container(),
        isHasCart
            ? AppbarIconButton(
                onPressed: onPressedCart,
                icon: Icons.shopping_cart_outlined,
              )
            : Container(),
        if (isHasCustomIcon && customIconWidget != null)
          customIconWidget ?? Container(),
      ],
    );
  }
}
