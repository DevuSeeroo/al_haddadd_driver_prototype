import 'dart:async';
import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart';
import 'package:alhaddad_driver/app/modules/home/providers/job_list_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:get/get.dart';

import '../../../utils/custom_logger.dart';
import '../models/job_list_model.dart';

class JobHistoryController extends GetxController {
  final isLoading = true.obs;

  final String className = "JobListController";
  List<JobList> actualJobList = [];
  RxList<JobList> jobList = <JobList>[].obs;
  List<int> orderStatusIDs = [];

  @override
  void onInit() {
    super.onInit();
    fetchJobListAPI();
    orderStatusIDs.add(AppConstants.cancelledStatusId);
    orderStatusIDs.add(AppConstants.completedStatusId);
  }

  void fetchJobList() {
    JobListProvider().getJobList(1).then((value) {
      // Timer(
      //     const Duration(seconds: 3),
      //         () => {});
      Timer(const Duration(seconds: 2), () {
        CustomLogger().print(jsonEncode(value), lineNumber: 35);
        actualJobList = value!.jobList ?? [];
        jobList.addAll(actualJobList);
        isLoading(false);
      });
    });
  }

  void fetchJobListAPI() {
    JobListProvider()
        .getJobListFromAPI(JobListInputParam(
            id: null, customerName: null, orderStatus: orderStatusIDs))
        .then((value) {
      if (value.getException != null) {
        ApiExceptionUtils().apiException(
            error: value.getException, className: className, lineNumber: 50);
      } else {
        actualJobList = value.data!.jobList ?? [];
        CustomLogger().print(jsonEncode(actualJobList), lineNumber: 53);
        jobList.addAll(actualJobList);
        isLoading(false);
      }
    });
  }

  void searchTextChanged(String value) {
    CustomLogger().print("onSearchTextChanged: $value",
        className: className, lineNumber: 62);
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
          className: className, lineNumber: 75);
    } else {
      jobList.clear();
      jobList.addAll(actualJobList);
      CustomLogger().print("updated list: ${jsonEncode(jobList)}",
          className: className, lineNumber: 80);
    }
  }
}
