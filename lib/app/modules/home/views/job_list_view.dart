import 'package:alhaddad_driver/app/modules/home/controllers/home_controller.dart';
import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/job_list/job_list_content.dart';

class JobListView extends GetView<JobListController> {
  JobListView({Key? key}) : super(key: key);

  @override
  final JobListController controller = Get.put(JobListController());

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: Get.find<HomeController>().onBackPressed,
      child: Scaffold(
        body: LoadingView(
            isLoading: controller.isLoading,
            child: JobListContent(jobList: controller.jobList)),
      ),
    );
  }
}
