import 'dart:convert';

import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/modules/job_detail/models/job_detail_model.dart';
import 'package:alhaddad_driver/app/modules/job_detail/models/job_failed_input_model.dart';
import 'package:alhaddad_driver/app/modules/job_detail/providers/job_detail_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/app_params_key.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:alhaddad_driver/app/utils/snackbar_utils.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_content/title_subtitle_bottomsheet_content.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_with_style.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/job_detail_json_model.dart';

class JobDetailController extends GetxController {
  String shippingId = "0";
  String from = "0";
  JobDetailData? data;
  JobDetail? dataModel;
  RxBool isLoading = true.obs;
  String className = "JobDetailController";
  JobDetailProvider provider = JobDetailProvider();

  TextEditingController reasonTextEditingController = TextEditingController();
  RxString buttonTitleText = "".obs;

  @override
  void onInit() {
    super.onInit();
    shippingId = Get.parameters[AppParamsKey.paramJobId].toString();
    from = Get.parameters[AppParamsKey.paramFrom].toString();
    // fetchJobDetailJson();
    fetchJobDetail();
  }

  void fetchJobDetailJson() {
    CustomLogger().print('fetchJobDetail for id:$shippingId', lineNumber: 43);
    provider.getJobDetail(shippingId).then((value) {
      data = value!.data;
      CustomLogger().print(jsonEncode(data), lineNumber: 46);
    });
  }

  void fetchJobDetail() {
    isLoading(true);
    CustomLogger().print('fetchJobDetail for id:$shippingId', lineNumber: 52);
    provider.fetchJobDetail(shippingId: shippingId).then((value) {
      if (value.getException != null) {
        ApiExceptionUtils().apiException(
            error: value.getException, className: className, lineNumber: 56);
      } else {
        dataModel = value.data;
        getButtonTitleText();
        // CustomLogger().print(jsonEncode(dataModel), lineNumber: 55);
        isLoading(false);
      }
    });
  }

  String dateValueToShow() {
    if (dataModel!.shippingStatusId ==
        AppConstants.shippingPackageReturnedStatusId) {
      return dataModel!.shipments!.first.returnedDate ?? "";
    } else {
      return dataModel!.shipments!.first.expectedDeliveryDate ?? "";
    }
  }

  String dateTitle() {
    if (Get.find<JobListController>().jobSelectedIndex.value ==
        AppConstants.jobHistoryIndex) {
      if (dataModel!.shippingStatusId ==
          AppConstants.shippingPackageReturnedStatusId) {
        return LocaleKeys.returnedDate.tr;
      } else {
        return LocaleKeys.deliveredDate.tr;
      }
    } else {
      return LocaleKeys.expectedDeliveryDate.tr;
    }
  }

  String toolbarTitleText() {
    if (dataModel != null) {
      if (dataModel!.driverShippingStatusId ==
          AppConstants.shippingDriverAssignedStatusId) {
        return LocaleKeys.assigned.tr;
      } else if (dataModel!.driverShippingStatusId ==
          AppConstants.shippingShippedStatusId) {
        return LocaleKeys.orderPickedUp.tr;
      } else if (dataModel!.driverShippingStatusId ==
          AppConstants.shippingInTransitStatusId) {
        return LocaleKeys.inTransit.tr;
      } else if (dataModel!.driverShippingStatusId ==
          AppConstants.shippingFailedStatusId) {
        return LocaleKeys.deliveryFailed.tr;
        // return LocaleKeys.packageReturned.tr;
      }
    }
    return "";
  }

  void getButtonTitleText() {
    if (dataModel != null) {
      if (dataModel!.driverShippingStatusId ==
          AppConstants.shippingShippedStatusId) {
        buttonTitleText(LocaleKeys.startJourney.tr);
        // return LocaleKeys.startJourney.tr;
      } else if (dataModel!.driverShippingStatusId ==
          AppConstants.shippingInTransitStatusId) {
        buttonTitleText(LocaleKeys.jobCompleted.tr);
        // return LocaleKeys.jobCompleted.tr;
      } else if (dataModel!.driverShippingStatusId ==
          AppConstants.shippingDriverAssignedStatusId) {
        buttonTitleText(LocaleKeys.orderPickedUp.tr);
        // return LocaleKeys.orderPickedUp.tr;
      } else if (dataModel!.driverShippingStatusId ==
          AppConstants.shippingFailedStatusId) {
        buttonTitleText(LocaleKeys.packageReturned.tr);
        // return LocaleKeys.packageReturned.tr;
      }
    }
    CustomLogger()
        .print("Button title text: ${buttonTitleText.value}", lineNumber: 125);
    // return "";
  }

  void buttonPressed() {
    CustomLogger().print(
        "buttonPressed() driver shipping status: ${dataModel!.driverShippingStatusId} ",
        className: className,
        lineNumber: 132);

    if (dataModel!.driverShippingStatusId ==
        AppConstants.shippingDriverAssignedStatusId) {
      CustomBottomSheet.showCustomBottomSheetWithMargin(
        TitleSubtitleBottomSheetContent(
          title: LocaleKeys.orderPickedUp.tr,
          subtitle: LocaleKeys.areYouSureYouWantToProceed.tr,
          positiveButtonPressed: () {
            Get.back();
            jobStatusChangeToShippedOrPickedAPI();
          },
          negativeButtonPressed: () {
            navigateWithMessage();
          },
        ),
      );
    } else if (dataModel!.driverShippingStatusId ==
        AppConstants.shippingInTransitStatusId) {
      jobStatusChangeToDeliveredAPI();
      // navigateWithMessage("Job status changed to reached");
    } else if (dataModel!.driverShippingStatusId ==
        AppConstants.shippingShippedStatusId) {
      jobStatusChangeToInTransitAPI();
      // navigateWithMessage("Job status changed to on the way");
    } else if (dataModel!.driverShippingStatusId ==
        AppConstants.shippingFailedStatusId) {
      jobStatusChangeToPackageReturnedAPI();
    }
    getButtonTitleText();
  }

  void deliveryFailedButtonPressed() {
    CustomLogger().print("Delivery failed pressed",
        className: className, lineNumber: 166);
    if (reasonTextEditingController.text.trim().isEmpty) {
      CustomSnackBar.showErrorSnackBar(LocaleKeys.error.tr,
          LocaleKeys.youMustEnterAReasonForFailedDelivery.tr);
      return;
    }
    provider
        .changeStatusToDeliveryFailed(JobFailedInputModel(
            shippingId: int.parse(shippingId),
            reason: reasonTextEditingController.text))
        .then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 181);
      } else {
        CustomLogger().print(
            "deliveryFailedButtonPressed: ${jsonEncode(response.data)}",
            lineNumber: 184);
        if (response.data!.statusCode == 200) {
          Get.back();
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}");
          fetchJobDetail();
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            LocaleKeys.somethingWentWrong.tr,
          );
        }
      }
    });
  }

  void jobStatusChangeToShippedOrPickedAPI() {
    // apiCalling(true);
    provider
        .changeStatusToShippedOrPicked(int.parse(shippingId))
        .then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 210);
      } else {
        if (response.data!.statusCode == 200) {
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}");
          fetchJobDetail();
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            LocaleKeys.somethingWentWrong.tr,
          );
        }
      }
      // apiCalling(false);
    });
  }

  void jobStatusChangeToPackageReturnedAPI() {
    // apiCalling(true);
    provider
        .changeStatusToPackageReturned(int.parse(shippingId))
        .then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 243);
      } else {
        if (response.data!.statusCode == 200) {
          Get.find<JobListController>().jobSelectedIndex.value !=
              AppConstants.jobPickedIndex;
          Get.back();
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}");
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            LocaleKeys.somethingWentWrong.tr,
          );
        }
      }
      // apiCalling(false);
    });
  }

  void jobStatusChangeToInTransitAPI() {
    // apiCalling(true);
    provider.changeStatusToInTransit(int.parse(shippingId)).then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 270);
      } else {
        if (response.data!.statusCode == 200) {
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}");
          fetchJobDetail();
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            LocaleKeys.somethingWentWrong.tr,
          );
        }
      }
      // apiCalling(false);
    });
  }

  void jobStatusChangeToDeliveredAPI() {
    // apiCalling(true);
    provider.changeStatusToDelivered(int.parse(shippingId)).then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 299);
      } else {
        if (response.data!.statusCode == 200) {
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}");
          NavigationUtils().callJobCompletedScreen(callBack: () {
            fetchJobDetail();
          });
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.error.tr,
            LocaleKeys.somethingWentWrong.tr,
          );
        }
      }
      // apiCalling(false);
    });
  }

  void navigateWithMessage([String? message]) {
    Get.back();
    if (message != null) {
      CustomSnackBar.showSuccessSnackBar(LocaleKeys.success.tr, message);
    }
  }
}
