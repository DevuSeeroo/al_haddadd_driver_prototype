import 'package:alhaddad_driver/app/modules/home/controllers/profile_controller.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/utilities.dart';
import 'package:get/get.dart';

import '../../../../generated/locales.g.dart';
import '../../../utils/app_constants.dart';
import 'job_list_controller.dart';

class HomeController extends GetxController {
  final RxInt homeSelectedIndex = AppConstants.homeIndex.obs;
  final RxString toolbarTitle = "".obs;

  String className = "HomeController";
  @override
  void onInit() {
    super.onInit();
    setSelectedIndex(AppConstants.homeIndex);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void setSelectedIndex(int index) {
    homeSelectedIndex(index);
    if (homeSelectedIndex.value == AppConstants.homeIndex) {
      toolbarTitle(LocaleKeys.jobs.tr);
      Get.delete<ProfileController>();
    } else if (homeSelectedIndex.value == AppConstants.profileIndex) {
      toolbarTitle(LocaleKeys.profile.tr);
      Get.delete<JobListController>();
    }
    CustomLogger().print("toolbarTitle: ${toolbarTitle.value}",
        className: className, lineNumber: 44);
  }

  Future<bool> onBackPressed() async {
    if (homeSelectedIndex.value == AppConstants.homeIndex) {
      Utilities().onBackPressed();
    } else {
      setSelectedIndex(AppConstants.homeIndex);
    }
    return false;
  }
}
