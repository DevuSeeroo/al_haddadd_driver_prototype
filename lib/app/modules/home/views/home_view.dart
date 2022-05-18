import 'package:alhaddad_driver/app/modules/home/views/job_list_view.dart';
import 'package:alhaddad_driver/app/modules/home/views/profile_view.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/widgets/views/empty_view.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../widgets/bottom_navigation_bar.dart';
import 'job_history_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: controller.onBackPressed,
      child: Scaffold(
        bottomNavigationBar: HomeBottomNavigationBar(
          controller: controller,
        ),
        body: Obx(() => buildHomeContentView()),
      ),
    );
  }

  Widget buildHomeContentView() {
    if (controller.selectedIndex.value == AppConstants.homeIndex) {
      return JobListView();
    } else if (controller.selectedIndex.value == AppConstants.profileIndex) {
      return ProfileView();
    } else if (controller.selectedIndex.value == AppConstants.historyIndex) {
      return JobHistoryView();
    } else {
      return EmptyView(
          subTitle: LocaleKeys.somethingWentWrong.tr,
          title: LocaleKeys.sorry.tr);
    }
  }
}
