import 'dart:async';
import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart';
import 'package:alhaddad_driver/app/modules/home/providers/job_list_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:get/get.dart';

import '../models/job_list_model.dart';

class JobListController extends GetxController {
  final isLoading = true.obs;

  final String className = "JobListController";
  RxList<JobList> jobList = <JobList>[].obs;

  @override
  void onInit() {
    CustomLogger().print('onInit', className: className, lineNumber: 20);
    super.onInit();
    fetchJobListAPI();
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
        .getJobListFromAPI(
            JobListInputParam(id: null, customerName: null, orderStatus: null))
        .then((value) {
      if (value.getException != null) {
        ApiExceptionUtils().apiException(
            error: value.getException, className: className, lineNumber: 45);
      } else {
        jobList.value = value.data!.jobList ?? [];
        try {
          CustomLogger().print(jsonEncode(jobList.value), lineNumber: 49);
          isLoading(false);
        } catch (e) {
          jobList.value = [];
          isLoading(false);
        }
      }
    });
  }
}
