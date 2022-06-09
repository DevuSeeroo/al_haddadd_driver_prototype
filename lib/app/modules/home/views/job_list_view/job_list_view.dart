import 'package:alhaddad_driver/app/modules/home/controllers/home_controller.dart';
import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/job_list_content.dart';

class JobListView extends GetView<JobListController> {
  JobListView({Key? key}) : super(key: key);

  @override
  final JobListController controller = Get.put(JobListController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Get.find<HomeController>().onBackPressed,
      child: Scaffold(
        body:
            JobListContent(controller: controller, jobList: controller.jobList),
      ),
    );
  }
}
