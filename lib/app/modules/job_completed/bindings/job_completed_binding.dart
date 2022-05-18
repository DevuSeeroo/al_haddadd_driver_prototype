import 'package:get/get.dart';

import '../controllers/job_completed_controller.dart';

class JobCompletedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobCompletedController>(
      () => JobCompletedController(),
    );
  }
}
