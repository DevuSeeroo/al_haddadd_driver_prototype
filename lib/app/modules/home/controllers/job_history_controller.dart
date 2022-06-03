import 'dart:async';
import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/providers/job_list_provider.dart';
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
    JobListProvider().getJobList(1).then((value) {
      // Timer(
      //     const Duration(seconds: 3),
      //         () => {});
      Timer(const Duration(seconds: 2), () {
        CustomLogger().print(jsonEncode(value), lineNumber: 29);
        actualJobList = value!.jobList ?? [];
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
        if ((element.name ?? "").contains(value)) {
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
