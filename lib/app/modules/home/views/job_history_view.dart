import 'package:alhaddad_driver/app/modules/home/controllers/job_history_controller.dart';
import 'package:alhaddad_driver/app/modules/home/widgets/job_list/job_list_content.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobHistoryView extends GetView<JobHistoryController> {
  JobHistoryView({Key? key}) : super(key: key);

  @override
  final JobHistoryController controller = Get.put(JobHistoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: LoadingView(
      isLoading: controller.isLoading,
      child: JobListContent(
        jobList: controller.jobList,
        isShowSearch: true,
        onSearchTextChanged: (value) {
          controller.searchTextChanged(value);
        },
      ),
    ));
  }
}
