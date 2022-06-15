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
  final isLoadingMore = true.obs;

  final String className = "JobListController";
  RxList<JobList> jobList = <JobList>[].obs;
  final RxInt jobSelectedIndex = AppConstants.jobAssignedIndex.obs;
  List<int> orderStatusIDs = [];
  List<int> tempOrderStatusIDs = [];
  DateTime? choosedFromDate;
  DateTime? choosedToDate;
  List<OrderStatusModel> actualOrderStatuses = [];
  List<OrderStatusModel> tempOrderStatuses = [];
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();

  int pageNumber = 1;
  int perPageCount = 1;
  int totalPages = 1;

  @override
  void onInit() {
    CustomLogger().print('onInit', className: className, lineNumber: 28);
    super.onInit();
    fetchJobListAPI();
  }

  bool onScrollNotification(ScrollNotification scrollInfo) {
    if (!isLoadingMore.value &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
        pageNumber <= totalPages) {
      pageNumber = pageNumber + 1;
      if (pageNumber <= totalPages) {
        isLoadingMore.value = true;
        pageNumber = pageNumber;
        fetchJobListAPI();
        CustomLogger().print(
            '_pagination- page $pageNumber total page $totalPages',
            lineNumber: 53);
        CustomLogger().print('_pageNumber $pageNumber', lineNumber: 54);
      } else {
        CustomLogger().print('_pagination- no more pages', lineNumber: 56);
        isLoading.value = false;
        isLoadingMore.value = false;
      }
    }
    return false;
  }

  resetPagination() {
    pageNumber = 1;
    perPageCount = 1;
    jobList.clear();
  }

  void createOrderStatusListBasedOnIndex() {
    actualOrderStatuses = JobListProvider()
        .createOrderStatusListBasedOnIndex(jobSelectedIndex.value);
    CustomLogger().print(
        "OrderStatusListBasedOnIndex: ${jsonEncode(actualOrderStatuses)}",
        className: className,
        lineNumber: 52);
    tempOrderStatuses.clear();
    tempOrderStatuses.addAll(actualOrderStatuses);
  }

  void orderStatusSelected(OrderStatusModel model) {
    int index = tempOrderStatuses.indexOf(model);
    print('$index');
    for (int i = 0; i < tempOrderStatuses.length; i++) {
      if (index == i) {
        tempOrderStatuses[i].isSelected(true);
      } else {
        tempOrderStatuses[i].isSelected(false);
      }
    }
    tempOrderStatusIDs.clear();
    if (model.orderStatusId == 0) {
      tempOrderStatusIDs = [
        AppConstants.cancelledStatusId,
        AppConstants.completedStatusId
      ];
    } else {
      tempOrderStatusIDs.add(model.orderStatusId ?? 0);
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
    CustomLogger().print("OrderStatusIds: $tempOrderStatusIDs", lineNumber: 70);
  }

  void applyClicked() {
    orderStatusIDs.clear();
    orderStatusIDs.addAll(tempOrderStatusIDs);
    actualOrderStatuses.clear();
    actualOrderStatuses.addAll(tempOrderStatuses);
    tempOrderStatusIDs.clear();
    tempOrderStatuses.clear();
    resetPagination();
    isLoading(true);
    fetchJobListAPI();
  }

  void fetchJobListAPI() {
    createOrderStatusListBasedOnIndex();
    orderStatusIds();
    JobListProvider()
        .getJobListFromAPI(JobListInputParam(
            toDate: choosedToDate != null
                ? CustomDateUtils().convertDateToString(
                    date: choosedToDate!,
                    currentFormat: "",
                    neededFormat: "dd/MM/yyyy")
                : null,
            searchKey: null,
            fromDate: choosedFromDate != null
                ? CustomDateUtils().convertDateToString(
                    date: choosedFromDate!,
                    currentFormat: "",
                    neededFormat: "dd/MM/yyyy")
                : null,
            orderStatus: orderStatusIDs,
            pageSize: perPageCount,
            pageNumber: pageNumber))
        .then((value) {
      if (value.getException != null) {
        ApiExceptionUtils().apiException(
            error: value.getException, className: className, lineNumber: 156);
      } else {
        totalPages = value.data!.totalPages ?? 1;
        jobList.addAll(value.data != null ? value.data!.jobList ?? [] : []);
        try {
          CustomLogger().print(jsonEncode(jobList), lineNumber: 159);
        } catch (e) {
          jobList.value = [];
        }
      }
      isLoadingMore(false);
      isLoading(false);
    });
  }

  setJobSelectedIndex(int index) {
    jobSelectedIndex(index);
    resetPagination();
    isLoading(true);
    fetchJobListAPI();
  }

  orderStatusIds() {
    CustomLogger().print("OrderStatusIDs: $orderStatusIDs", lineNumber: 138);
    if (jobSelectedIndex.value == AppConstants.jobHistoryIndex) {
      orderStatusIDs = [
        AppConstants.cancelledStatusId,
        AppConstants.completedStatusId
      ];
    } else if (jobSelectedIndex.value == AppConstants.jobAssignedIndex) {
      orderStatusIDs = [AppConstants.processingStatusId];
    } else if (jobSelectedIndex.value == AppConstants.jobPickedIndex) {
      orderStatusIDs = [
        AppConstants.shippedStatusId,
        AppConstants.inTransitStatusId,
        AppConstants.deliveryFailedStatusId,
      ];
    }
    tempOrderStatusIDs.clear();
    CustomLogger().print("OrderStatusIDs: $orderStatusIDs after clearing temp",
        lineNumber: 151);
    tempOrderStatusIDs.addAll(orderStatusIDs);
  }

  void datePickerFunction(BuildContext context,
      {required bool whetherFromDate}) {
    showDatePicker(
            locale: const Locale('en', 'IN'),
            fieldHintText: "dd/MM/yyyy",
            context: context,
            initialDate: whetherFromDate
                ? choosedFromDate ?? DateTime.now()
                : choosedToDate ?? DateTime.now(),
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
      choosedFromDate = pickedDate;
      if (whetherFromDate) {
        fromDateController.text = CustomDateUtils().convertDateToString(
            date: choosedFromDate ?? DateTime.now(),
            currentFormat: "",
            neededFormat: "dd/MM/y"
                "yyy");
      } else {
        toDateController.text = CustomDateUtils().convertDateToString(
            date: choosedToDate ?? DateTime.now(),
            currentFormat: "",
            neededFormat: "dd/MM/yyy"
                "y");
      }
      // fetchJobListAPI();
    });
  }
}
