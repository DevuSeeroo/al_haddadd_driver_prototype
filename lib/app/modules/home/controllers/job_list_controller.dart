import 'dart:async';
import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart';
import 'package:alhaddad_driver/app/modules/home/providers/job_list_provider.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:get/get.dart';

import '../models/job_list_model.dart';

class JobListController extends GetxController {
  final isLoading = true.obs;

  final String className = "JobListController";
  RxList<JobList> jobList = <JobList>[].obs;

  @override
  void onInit() {
    CustomLogger().print('onInit', className: className, lineNumber: 18);
    super.onInit();
    fetchJobList();
  }

  void fetchJobList() {
    JobListProvider().getJobList(1).then((value) {
      // Timer(
      //     const Duration(seconds: 3),
      //         () => {});
      Timer(const Duration(seconds: 2), () {
        CustomLogger().print(jsonEncode(value), lineNumber: 31);
        jobList.value = value!.jobList ?? [];
        isLoading(false);
      });
    });
  }

  void fetchJobListAPI() {
    JobListProvider()
        .getJobListFromAPI2(JobListInputParam(
            id: AppConstants.testID, customerName: null, orderStatus: null))
        .then((value) {
      CustomLogger().print(jsonEncode(value), lineNumber: 48);
      jobList.value = value.data!.jobList ?? [];
      isLoading(false);
    });
  }

  @override
  void onClose() {}
}
