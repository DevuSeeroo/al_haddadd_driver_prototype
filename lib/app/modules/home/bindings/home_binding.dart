import 'package:get/get.dart';

import 'package:alhaddad_driver/app/modules/home/controllers/job_history_controller.dart';
import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/modules/home/controllers/profile_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobListController>(
      () => JobListController(),
    );
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<JobHistoryController>(
      () => JobHistoryController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
