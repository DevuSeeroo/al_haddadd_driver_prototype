import 'package:alhaddad_driver/app/modules/home/controllers/job_history_controller.dart';
import 'package:alhaddad_driver/app/modules/home/controllers/profile_controller.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/utilities.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/app_constants.dart';
import 'job_list_controller.dart';

class HomeController extends GetxController {
  final RxInt selectedIndex = AppConstants.homeIndex.obs;
  final RxString toolbarTitle = "".obs;

  String className = "HomeController";
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void setSelectedIndex(int index) {
    selectedIndex(index);
    if (selectedIndex.value == AppConstants.homeIndex) {
      toolbarTitle(LocaleKeys.jobListing.tr);
      Get.delete<ProfileController>();
      Get.delete<JobHistoryController>();
    } else if (selectedIndex.value == AppConstants.profileIndex) {
      toolbarTitle(LocaleKeys.profile.tr);
      Get.delete<JobListController>();
      Get.delete<JobHistoryController>();
    } else {
      toolbarTitle(LocaleKeys.history.tr);
      Get.delete<JobListController>();
      Get.delete<ProfileController>();
    }
    CustomLogger().print("toolbarTitle: ${toolbarTitle.value}",
        className: className, lineNumber: 44);
  }

  Future<bool> onBackPressed() async {
    if (selectedIndex.value == AppConstants.homeIndex) {
      Utilities().onBackPressed();
    } else {
      selectedIndex(AppConstants.homeIndex);
    }
    return false;
  }
}
