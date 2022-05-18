import 'package:alhaddad_driver/app/modules/home/widgets/bottom_nav_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_constants.dart';
import '../controllers/home_controller.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 10,
      child: SizedBox(
          height: 60,
          child: Obx(() {
            return Row(
              children: [
                BottomNavItem(
                  onPressed: () {
                    controller.setSelectedIndex(AppConstants.homeIndex);
                  },
                  icon: Icons.home,
                  isSelected:
                      controller.selectedIndex.value == AppConstants.homeIndex,
                ),
                BottomNavItem(
                  onPressed: () {
                    controller.setSelectedIndex(AppConstants.profileIndex);
                  },
                  icon: Icons.person,
                  isSelected: controller.selectedIndex.value ==
                      AppConstants.profileIndex,
                ),
                BottomNavItem(
                  onPressed: () {
                    controller.setSelectedIndex(AppConstants.historyIndex);
                  },
                  icon: Icons.refresh,
                  isSelected: controller.selectedIndex.value ==
                      AppConstants.historyIndex,
                ),
              ],
            );
          })),
    );
  }
}
