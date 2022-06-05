import 'dart:async';
import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart';
import 'package:alhaddad_driver/app/modules/home/providers/job_list_provider.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../../utils/custom_logger.dart';
import '../models/job_list_model.dart';

class JobHistoryController extends GetxController {
  final isLoading = true.obs;

  final String className = "JobListController";
  List<JobList> actualJobList = [];
  RxList<JobList> jobList = <JobList>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchJobList();
  }

  void fetchJobList() {
    JobListProvider()
        .getJobListFromAPI(JobListInputParam(
            id: AppConstants.testID, customerName: null, orderStatus: null))
        .then((value) {
      // Timer(
      //     const Duration(seconds: 3),
      //         () => {});
      Timer(const Duration(seconds: 2), () {
        CustomLogger().print(jsonEncode(value), lineNumber: 29);
        actualJobList = value.data!.jobList ?? [];
        jobList.addAll(actualJobList);
        isLoading(false);
      });
    });
  }

  void searchTextChanged(String value) {
    CustomLogger().print("onSearchTextChanged: $value",
        className: className, lineNumber: 39);
    if (value.isNotEmpty) {
      List<JobList> updatedList = [];
      for (var element in actualJobList) {
        if ((element.customOrderNumber ?? "").contains(value)) {
          updatedList.add(element);
        }
      }

      jobList.clear();
      jobList.addAll(updatedList);

      CustomLogger().print("updated list: ${jsonEncode(jobList)}",
          className: className, lineNumber: 52);
    } else {
      jobList.clear();
      jobList.addAll(actualJobList);
      CustomLogger().print("updated list: ${jsonEncode(jobList)}",
          className: className, lineNumber: 56);
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
