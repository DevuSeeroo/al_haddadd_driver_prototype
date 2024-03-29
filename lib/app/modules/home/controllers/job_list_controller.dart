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
  // List<int> orderStatusIDs = [];
  List<int> shippingStatusIDs = [];
  List<int> tempOrderStatusIDs = [];
  List<ShippingStatusModel> actualShippingStatuses = [];
  String actualShippingStatusesJson = "";
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

  String statusMessageNew(int id, {String? shippingStatusFromAPI}) {
    if (id == AppConstants.shippingDriverAssignedStatusId) {
      return LocaleKeys.assigned.tr;
    } else if (id == AppConstants.shippingShippedStatusId) {
      return LocaleKeys.pickedUp.tr;
    } else if (id == AppConstants.shippingInTransitStatusId) {
      return LocaleKeys.inTransit.tr;
    } else if (id == AppConstants.shippingCompletedStatusId) {
      return LocaleKeys.delivered.tr;
    } else if (id == AppConstants.shippingFailedStatusId) {
      return LocaleKeys.deliveryFailed.tr;
    } else if (id == AppConstants.shippingPackageReturnedStatusId) {
      return LocaleKeys.returned.tr;
    }
    return shippingStatusFromAPI ?? "";
  }

  String statusMessage(OrderDetail orderDetail) {
    if (orderDetail.orderStatusId == AppConstants.processingStatusId) {
      return LocaleKeys.assigned.tr;
    } else if (orderDetail.orderStatusId == AppConstants.shippedStatusId &&
        orderDetail.shippingStatusId == AppConstants.shippingShippedStatusId) {
      return LocaleKeys.pickedUp.tr;
    } else if (orderDetail.orderStatusId == AppConstants.shippedStatusId &&
        orderDetail.shippingStatusId ==
            AppConstants.shippingInTransitStatusId) {
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
    actualShippingStatuses = [];
    actualShippingStatuses.addAll(JobListProvider()
        .createOrderStatusListBasedOnIndex(jobSelectedIndex.value));
    convertAndSaveActualOrderStatusToString();
    CustomLogger().print(
        "saved/reverted actualShippingStatuses: "
        "$actualShippingStatusesJson",
        lineNumber: 127);
    printOrderStatuses(message: "OrderStatusListBasedOnIndex", lineNumber: 112);
  }

  String convertAndSaveActualOrderStatusToString() {
    CustomLogger().print(
        "saved/reverted actualShippingStatuses:${jsonEncode(actualShippingStatuses)}",
        lineNumber: 135);
    actualShippingStatusesJson =
        "{\"list\":${jsonEncode(actualShippingStatuses)}}";
    return actualShippingStatusesJson;
  }

  void revertAndSaveStringToActualOrderStatus() {
    CustomLogger().print(
        "saved/reverted actualShippingStatuses:${jsonEncode(actualShippingStatuses)}",
        lineNumber: 142);
    if (isFilterApplied.value) {
      CustomLogger().print(
          "revertAndSaveStringToActualOrderStatus: ${jsonDecode(actualShippingStatusesJson)}",
          lineNumber: 145);
      jsonDecode(actualShippingStatusesJson)['list'].forEach((v) {
        actualShippingStatuses.add(ShippingStatusModel.fromJson(v));
      });
    } else {
      CustomLogger().print(
          "revertAndSaveStringToActualOrderStatus filter not applied",
          lineNumber: 151);
    }
  }

  void orderStatusSelected(ShippingStatusModel model) {
    int index = actualShippingStatuses.indexOf(model);
    CustomLogger().print('Index: $index', lineNumber: 120);
    for (int i = 0; i < actualShippingStatuses.length; i++) {
      if (index == i) {
        actualShippingStatuses[i].isSelected(true);
      } else {
        actualShippingStatuses[i].isSelected(false);
      }
    }
    tempOrderStatusIDs.clear();
    if (model.orderStatusId == 0) {
      tempOrderStatusIDs = jobHistoryShippingStatusIds();
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
    CustomLogger()
        .print("isFilterApplied: ${isFilterApplied.value}", lineNumber: 192);
    printOrderStatusIds(message: 'before Apply Clicked:', lineNumber: 149);
    actualFromDate = chosenFromDate;
    actualToDate = chosenToDate;
    // orderStatusIDs.clear();
    // orderStatusIDs.addAll(tempOrderStatusIDs);
    shippingStatusIDs.clear();
    shippingStatusIDs.addAll(tempOrderStatusIDs);
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
    fromDateController.text = actualFromDate != null
        ? CustomDateUtils().convertDateToString(
            date: actualFromDate!,
            currentFormat: "",
            neededFormat: "dd-MM-yyyy")
        : "";
    toDateController.text = actualToDate != null
        ? CustomDateUtils().convertDateToString(
            date: actualToDate!, currentFormat: "", neededFormat: "dd-MM-yyyy")
        : "";
    chosenToDate = actualToDate;
    chosenFromDate = actualFromDate;
    actualShippingStatuses = [];
    CustomLogger().print(
        "filterCloseClicked: ${jsonDecode(actualShippingStatusesJson)}",
        lineNumber: 199);
    jsonDecode(actualShippingStatusesJson)['list'].forEach((v) {
      actualShippingStatuses.add(ShippingStatusModel.fromJson(v));
    });
    printOrderStatuses(message: "filterCloseClicked:", lineNumber: 187);
    Get.back();
  }

  void clearAllClicked({required bool isBackNeeded}) {
    isFilterApplied(false);
    CustomLogger()
        .print("isFilterApplied: ${isFilterApplied.value}", lineNumber: 238);
    fromDateController.text = "";
    toDateController.text = "";
    chosenToDate = null;
    chosenFromDate = null;
    actualShippingStatuses = JobListProvider()
        .createOrderStatusListBasedOnIndex(jobSelectedIndex.value);
    isLoading(true);
    if (isBackNeeded) {
      Get.back();
    }
  }

  void printOrderStatusIds({required String message, required int lineNumber}) {
    CustomLogger().print("$message tempOrderStatusIDs: $tempOrderStatusIDs",
        lineNumber: lineNumber);
    CustomLogger().print(
        "after Apply Clicked: orderStatusIDs: $shippingStatusIDs",
        lineNumber: lineNumber);
  }

  void printOrderStatuses({required String message, required int lineNumber}) {
    CustomLogger().print(
        "$message actualOrderStatuses: ${jsonEncode(actualShippingStatuses)}",
        lineNumber: lineNumber);
  }

  void fetchJobListAPI({required String from}) {
    CustomLogger().print(
        "fetchJobListAPI called from: $from, "
        "isFilterApplied: ${isFilterApplied.value}",
        lineNumber: 223);
    if (from == "init" ||
        from == "clearAllClicked" ||
        actualShippingStatuses.isEmpty) {
      createOrderStatusListBasedOnIndex();
    }
    if (from != "filter") {
      orderStatusIds();
    }
    JobListProvider()
        .getJobListFromAPI(JobListInputParam(
            toDate: actualToDate != null
                ? CustomDateUtils().convertDateToString(
                    date: actualToDate!,
                    currentFormat: "",
                    neededFormat: "dd-MM-yyyy")
                : null,
            toDateTime: actualToDate,
            searchKey: searchKey.value,
            fromDate: actualFromDate != null
                ? CustomDateUtils().convertDateToString(
                    date: actualFromDate!,
                    currentFormat: "",
                    neededFormat: "dd-MM-yyyy")
                : null,
            fromDateTime: actualFromDate,
            // orderStatus: orderStatusIDs,
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
      // orderStatusIDs = jobHistoryOrderStatusIds();
      shippingStatusIDs = jobHistoryShippingStatusIds();
    } else if (jobSelectedIndex.value == AppConstants.jobAssignedIndex) {
      // orderStatusIDs = [AppConstants.processingStatusId];
      shippingStatusIDs = jobAssignedStatusIds();
    } else if (jobSelectedIndex.value == AppConstants.jobPickedIndex) {
      // orderStatusIDs = [
      //   AppConstants.shippedStatusId,
      //   AppConstants.deliveryFailedStatusId,
      // ];
      shippingStatusIDs = jobPickedStatusIds();
    }
    tempOrderStatusIDs.clear();
    printOrderStatusIds(message: 'after clearing temp', lineNumber: 274);
    tempOrderStatusIDs.addAll(shippingStatusIDs);
  }

  List<int> jobAssignedStatusIds() =>
      [AppConstants.shippingDriverAssignedStatusId];

  List<int> jobPickedStatusIds() {
    return [
      AppConstants.shippingDriverPartiallyShippedStatusId,
      AppConstants.shippingShippedStatusId,
      AppConstants.shippingInTransitStatusId,
      AppConstants.shippingFailedStatusId
    ];
  }

  List<int> jobHistoryShippingStatusIds() {
    return [
      AppConstants.shippingPackageReturnedStatusId,
      AppConstants.shippingCompletedStatusId,
    ];
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
