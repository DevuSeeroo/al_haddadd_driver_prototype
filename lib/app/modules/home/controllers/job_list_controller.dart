import 'dart:async';
import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart';
import 'package:alhaddad_driver/app/modules/home/models/order_status_model.dart';
import 'package:alhaddad_driver/app/modules/home/providers/job_list_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/date_utlis.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/job_list_model.dart';

class JobListController extends GetxController {
  final isLoading = true.obs;

  final String className = "JobListController";
  RxList<JobList> jobList = <JobList>[].obs;
  final RxInt jobSelectedIndex = AppConstants.jobAssignedIndex.obs;
  List<int> orderStatusIDs = [];
  DateTime choosedDate = DateTime.now();
  List<OrderStatusModel> actualOrderStatuses = [];
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  @override
  void onInit() {
    CustomLogger().print('onInit', className: className, lineNumber: 28);
    super.onInit();
    fetchJobListAPI();
  }

  void fetchJobList() {
    JobListProvider().getJobList(1).then((value) {
      // Timer(
      //     const Duration(seconds: 3),
      //         () => {});
      Timer(const Duration(seconds: 2), () {
        CustomLogger().print(jsonEncode(value), lineNumber: 39);
        jobList.value = value!.jobList ?? [];
        isLoading(false);
      });
    });
  }

  void createOrderStatusListBasedOnIndex() {
    actualOrderStatuses = JobListProvider()
        .createOrderStatusListBasedOnIndex(jobSelectedIndex.value);
    CustomLogger().print(
        "OrderStatusListBasedOnIndex: ${jsonEncode(actualOrderStatuses)}",
        className: className,
        lineNumber: 52);
  }

  void orderStatusSelected(OrderStatusModel model) {
    int index = actualOrderStatuses.indexOf(model);
    print('$index');
    for (int i = 0; i < actualOrderStatuses.length; i++) {
      if (index == i) {
        actualOrderStatuses[i].isSelected(true);
      } else {
        actualOrderStatuses[i].isSelected(false);
      }
    }
    orderStatusIDs.clear();
    if (model.orderStatusId == 0) {
      orderStatusIDs = [
        AppConstants.cancelledStatusId,
        AppConstants.completedStatusId
      ];
    } else {
      orderStatusIDs.add(model.orderStatusId ?? 0);
    }

    // int? indexToDelete;
    // if (orderStatusIDs.isNotEmpty) {
    //   for (int i = 0; i < orderStatusIDs.length; i++) {
    //     if (actualOrderStatuses[index].orderStatusId != null &&
    //         actualOrderStatuses[index].orderStatusId == orderStatusIDs[i]) {
    //       indexToDelete = i;
    //     }
    //   }
    // }
    // if (indexToDelete != null) {
    //   orderStatusIDs.removeAt(indexToDelete);
    // } else {
    //   orderStatusIDs.add(actualOrderStatuses[index].orderStatusId ?? 0);
    // }
    CustomLogger().print("OrderStatusIds: $orderStatusIDs", lineNumber: 70);
  }

  void fetchJobListAPI() {
    isLoading(true);
    createOrderStatusListBasedOnIndex();
    orderStatusIds();
    JobListProvider()
        .getJobListFromAPI(JobListInputParam(
            id: null,
            customerName: null,
            dateChoosed: CustomDateUtils().convertDateToString(
                date: choosedDate,
                currentFormat: "",
                neededFormat: "dd/MM/yyyy"),
            orderStatus: orderStatusIDs))
        .then((value) {
      if (value.getException != null) {
        ApiExceptionUtils().apiException(
            error: value.getException, className: className, lineNumber: 70);
      } else {
        jobList.value = value.data != null ? value.data!.jobList ?? [] : [];
        try {
          CustomLogger().print(jsonEncode(jobList), lineNumber: 74);
        } catch (e) {
          jobList.value = [];
        }
      }
      isLoading(false);
    });
  }

  setJobSelectedIndex(int index) {
    jobSelectedIndex(index);
    fetchJobListAPI();
  }

  orderStatusIds() {
    if (jobSelectedIndex.value == AppConstants.jobHistoryIndex) {
      orderStatusIDs = [
        AppConstants.cancelledStatusId,
        AppConstants.completedStatusId
      ];
    } else if (jobSelectedIndex.value == AppConstants.jobAssignedIndex) {
      orderStatusIDs = [AppConstants.processingStatusId];
    } else if (jobSelectedIndex.value == AppConstants.jobPickedIndex) {
      orderStatusIDs = [AppConstants.shippedStatusId];
    }
    orderStatusIDs = [];
  }

  void datePickerFunction(BuildContext context,
      {required bool whetherFromDate}) {
    showDatePicker(
            locale: const Locale('en', 'IN'),
            fieldHintText: "dd/MM/yyyy",
            context: context,
            initialDate: choosedDate,
            //which date will display when user open the picker
            firstDate: DateTime(2022),
            //what will be the previous supported year in picker
            // lastDate: DateTime(lastDateYear, month + 3, DateTime.now().day))
            lastDate: DateTime(DateTime.now().year + 1))
        //what will be the up to supported date in picker
        .then((pickedDate) {
      //then usually do the future job
      if (pickedDate == null) {
        //if user tap cancel then this function will stop
        CustomLogger().print("user clicked cancel", lineNumber: 115);
        // textEditingController.text = "";
        return;
      }
      CustomLogger().print("user selected date: $pickedDate",
          className: className, lineNumber: 120);
      choosedDate = pickedDate;
      if (whetherFromDate) {
        fromDateController.text = CustomDateUtils().convertDateToString(
            date: choosedDate, currentFormat: "", neededFormat: "dd/MM/yyyy");
      } else {
        toDateController.text = CustomDateUtils().convertDateToString(
            date: choosedDate, currentFormat: "", neededFormat: "dd/MM/yyyy");
      }
      // fetchJobListAPI();
    });
  }
}
