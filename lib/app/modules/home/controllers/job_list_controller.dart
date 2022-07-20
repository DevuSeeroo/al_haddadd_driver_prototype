import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/models/job_list_input_param_model.dart';
import 'package:alhaddad_driver/app/modules/home/models/order_status_model.dart';
import 'package:alhaddad_driver/app/modules/home/providers/job_list_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/date_utlis.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/job_list_model.dart';

class JobListController extends GetxController {
  final isLoading = true.obs;
  final isLoadingMore = true.obs;
  final isFilterApplied = false.obs;

  final String className = "JobListController";
  RxList<JobList> jobList = <JobList>[].obs;
  final RxInt jobSelectedIndex = AppConstants.jobAssignedIndex.obs;
  List<int> orderStatusIDs = [];
  List<int> shippingStatusIDs = [];
  List<int> tempOrderStatusIDs = [];
  List<OrderStatusModel> actualOrderStatuses = [];
  String actualOrderStatusesJson = "";
  TextEditingController fromDateController = TextEditingController();
  TextEditingController toDateController = TextEditingController();
  DateTime? chosenFromDate;
  DateTime? chosenToDate;
  DateTime? actualFromDate;
  DateTime? actualToDate;
  int pageNumber = 1;
  int perPageCount = 10;
  int totalPages = 1;
  RxString searchKey = "".obs;

  @override
  void onInit() {
    CustomLogger().print('onInit', className: className, lineNumber: 39);
    super.onInit();
    fetchJobListAPI(from: "init");
  }

  String statusMessage(OrderDetail orderDetail) {
    if (orderDetail.orderStatusId == AppConstants.processingStatusId) {
      return LocaleKeys.assigned.tr;
    } else if (orderDetail.orderStatusId == AppConstants.shippedStatusId &&
        orderDetail.shippingStatusId == AppConstants.shippingShippedStatusId) {
      return LocaleKeys.pickedUp.tr;
    } else if (orderDetail.orderStatusId == AppConstants.shippedStatusId &&
        orderDetail.shippingStatusId == AppConstants.inTransitStatusId) {
      return LocaleKeys.inTransit.tr;
    } else if (orderDetail.orderStatusId == AppConstants.completedStatusId &&
        orderDetail.shippingStatusId ==
            AppConstants.shippingCompletedStatusId) {
      return LocaleKeys.delivered.tr;
    } else if (orderDetail.orderStatusId ==
            AppConstants.deliveryFailedStatusId &&
        orderDetail.shippingStatusId == AppConstants.shippingFailedStatusId) {
      return LocaleKeys.failed.tr;
    } else if (orderDetail.orderStatusId ==
            AppConstants.deliveryFailedStatusId &&
        orderDetail.shippingStatusId ==
            AppConstants.shippingPackageReturnedStatusId) {
      return LocaleKeys.returned.tr;
    }
    return orderDetail.orderStatus ?? "";
  }

  bool onScrollNotification(ScrollNotification scrollInfo) {
    if (!isLoadingMore.value &&
        scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
        pageNumber <= totalPages) {
      pageNumber = pageNumber + 1;
      if (pageNumber <= totalPages) {
        isLoadingMore.value = true;
        pageNumber = pageNumber;
        fetchJobListAPI(from: "onScrollNotification");
        CustomLogger().print(
            '_pagination- page $pageNumber total page $totalPages',
            lineNumber: 53);
        CustomLogger().print('_pageNumber $pageNumber', lineNumber: 56);
      } else {
        CustomLogger().print('_pagination- no more pages', lineNumber: 58);
        isLoading.value = false;
        isLoadingMore.value = false;
      }
    }
    return false;
  }

  resetPagination() {
    pageNumber = 1;
    perPageCount = 10;
    jobList.clear();
    isLoading(true);
  }

  void createOrderStatusListBasedOnIndex() {
    actualOrderStatuses = [];
    actualOrderStatuses.addAll(JobListProvider()
        .createOrderStatusListBasedOnIndex(jobSelectedIndex.value));
    convertAndSaveActualOrderStatusToString();
    print("createOrderStatusListBasedOnIndex: $actualOrderStatusesJson");
    printOrderStatuses(message: "OrderStatusListBasedOnIndex", lineNumber: 112);
  }

  String convertAndSaveActualOrderStatusToString() =>
      actualOrderStatusesJson = "{\"list\":${jsonEncode(actualOrderStatuses)}}";

  void orderStatusSelected(OrderStatusModel model) {
    int index = actualOrderStatuses.indexOf(model);
    CustomLogger().print('Index: $index', lineNumber: 120);
    for (int i = 0; i < actualOrderStatuses.length; i++) {
      if (index == i) {
        actualOrderStatuses[i].isSelected(true);
      } else {
        actualOrderStatuses[i].isSelected(false);
      }
    }
    tempOrderStatusIDs.clear();
    if (model.orderStatusId == 0) {
      tempOrderStatusIDs = jobHistoryOrderStatusIds();
    } else {
      tempOrderStatusIDs.add(model.orderStatusId ?? 0);
    }

    CustomLogger()
        .print("tempOrderStatusIDs: $tempOrderStatusIDs", lineNumber: 136);
    printOrderStatuses(message: '', lineNumber: 137);
  }

  List<int> jobHistoryOrderStatusIds() {
    return [
      AppConstants.cancelledStatusId,
      AppConstants.completedStatusId,
      AppConstants.deliveryFailedStatusId,
    ];
  }

  void applyClicked() {
    isFilterApplied(true);
    printOrderStatusIds(message: 'before Apply Clicked:', lineNumber: 149);
    actualFromDate = chosenFromDate;
    actualToDate = chosenToDate;
    orderStatusIDs.clear();
    orderStatusIDs.addAll(tempOrderStatusIDs);
    tempOrderStatusIDs.clear();
    convertAndSaveActualOrderStatusToString();
    resetPagination();
    isLoading(true);
    printOrderStatusIds(message: 'after Apply Clicked:', lineNumber: 156);
    printOrderStatuses(message: "after Apply Clicked: ", lineNumber: 157);
    fetchJobListAPI(from: "filter");
    Get.back();
  }

  void filterCloseClicked() {
    fromDateController.text =
        actualFromDate != null ? actualFromDate.toString() : "";
    toDateController.text = actualToDate != null ? actualToDate.toString() : "";
    chosenToDate = actualToDate;
    chosenFromDate = actualFromDate;
    actualOrderStatuses = [];
    print("filterCloseClicked: ${jsonDecode(actualOrderStatusesJson)}");
    jsonDecode(actualOrderStatusesJson)['list'].forEach((v) {
      actualOrderStatuses.add(OrderStatusModel.fromJson(v));
    });
    printOrderStatuses(message: "filterCloseClicked:", lineNumber: 187);
    Get.back();
  }

  void clearAllClicked({required bool isBackNeeded}) {
    isFilterApplied(false);
    fromDateController.text = "";
    toDateController.text = "";
    chosenToDate = null;
    chosenFromDate = null;
    actualOrderStatuses = JobListProvider()
        .createOrderStatusListBasedOnIndex(jobSelectedIndex.value);
    isLoading(true);
    if (isBackNeeded) {
      Get.back();
    }
  }

  void printOrderStatusIds({required String message, required int lineNumber}) {
    CustomLogger().print("$message tempOrderStatusIDs: $tempOrderStatusIDs",
        lineNumber: lineNumber);
    CustomLogger().print("after Apply Clicked: orderStatusIDs: $orderStatusIDs",
        lineNumber: lineNumber);
  }

  void printOrderStatuses({required String message, required int lineNumber}) {
    CustomLogger().print(
        "$message actualOrderStatuses: ${jsonEncode(actualOrderStatuses)}",
        lineNumber: lineNumber);
  }

  void fetchJobListAPI({required String from}) {
    CustomLogger().print("fetchJobListAPI called from: $from", lineNumber: 203);
    if (from == "init" || actualOrderStatuses.isEmpty) {
      createOrderStatusListBasedOnIndex();
    }
    if (from != "filter") {
      orderStatusIds();
    }
    JobListProvider()
        .getJobListFromAPI(JobListInputParam(
            toDate: chosenToDate != null
                ? CustomDateUtils().convertDateToString(
                    date: chosenToDate!,
                    currentFormat: "",
                    neededFormat: "dd-MM-yyyy")
                : null,
            toDateTime: chosenToDate,
            searchKey: searchKey.value,
            fromDate: chosenFromDate != null
                ? CustomDateUtils().convertDateToString(
                    date: chosenFromDate!,
                    currentFormat: "",
                    neededFormat: "dd-MM-yyyy")
                : null,
            fromDateTime: chosenFromDate,
            orderStatus: orderStatusIDs,
            shippingStatus: shippingStatusIDs,
            pageSize: perPageCount,
            pageNumber: pageNumber))
        .then((value) {
      if (value.getException != null) {
        ApiExceptionUtils().apiException(
            error: value.getException, className: className, lineNumber: 216);
      } else {
        try {
          totalPages = value.data!.totalPages ?? 1;
          jobList.addAll(value.data != null ? value.data!.jobList ?? [] : []);
        } catch (e) {
          jobList.value = [];
        }
      }
      isLoadingMore(false);
      isLoading(false);
      searchKey("");
    });
  }

  setJobSelectedIndex(int index) {
    jobSelectedIndex(index);
    resetPagination();
    isLoading(true);
    chosenToDate = null;
    chosenFromDate = null;
    fromDateController.text = "";
    toDateController.text = "";
    fetchJobListAPI(from: "setJobSelectedIndex");
  }

  orderStatusIds() {
    printOrderStatusIds(message: '', lineNumber: 252);
    if (jobSelectedIndex.value == AppConstants.jobHistoryIndex) {
      orderStatusIDs = jobHistoryOrderStatusIds();
      shippingStatusIDs = [
        AppConstants.shippingPackageReturnedStatusId,
        AppConstants.shippingCompletedStatusId,
      ];
    } else if (jobSelectedIndex.value == AppConstants.jobAssignedIndex) {
      orderStatusIDs = [AppConstants.processingStatusId];
      shippingStatusIDs = [];
    } else if (jobSelectedIndex.value == AppConstants.jobPickedIndex) {
      orderStatusIDs = [
        AppConstants.shippedStatusId,
        AppConstants.deliveryFailedStatusId,
      ];
      shippingStatusIDs = [
        AppConstants.inTransitStatusId,
        AppConstants.shippingShippedStatusId,
        AppConstants.shippingFailedStatusId
      ];
    }
    tempOrderStatusIDs.clear();
    printOrderStatusIds(message: 'after clearing temp', lineNumber: 274);
    tempOrderStatusIDs.addAll(orderStatusIDs);
  }

  void datePickerFunction(BuildContext context,
      {required bool whetherFromDate}) {
    showDatePicker(
            locale: const Locale('en', 'IN'),
            fieldHintText: "dd/MM/yyyy",
            context: context,
            initialDate: whetherFromDate
                ? chosenFromDate ?? DateTime.now()
                : chosenToDate ?? DateTime.now(),
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
        CustomLogger().print("user clicked cancel", lineNumber: 287);
        // textEditingController.text = "";
        return;
      }
      CustomLogger().print("user selected date: $pickedDate",
          className: className, lineNumber: 292);
      if (whetherFromDate) {
        chosenFromDate = pickedDate;
        fromDateController.text = CustomDateUtils().convertDateToString(
            date: chosenFromDate ?? DateTime.now(),
            currentFormat: "",
            neededFormat: "dd/MM/yyyy");
      } else {
        chosenToDate = pickedDate;
        toDateController.text = CustomDateUtils().convertDateToString(
            date: chosenToDate ?? DateTime.now(),
            currentFormat: "",
            neededFormat: "dd/MM/yyyy");
      }
      // fetchJobListAPI();
    });
  }
}
