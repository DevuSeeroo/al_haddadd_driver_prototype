import 'dart:convert';

import 'package:alhaddad_driver/app/modules/job_detail/models/job_detail_model.dart';
import 'package:alhaddad_driver/app/modules/job_detail/models/job_failed_input_model.dart';
import 'package:alhaddad_driver/app/modules/job_detail/providers/job_detail_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/app_params_key.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/custom_trace.dart';
import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:alhaddad_driver/app/utils/snackbar_utils.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_content/title_subtitle_bottomsheet_content.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_with_style.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/job_detail_json_model.dart';

class JobDetailController extends GetxController {
  String orderId = "0";
  String from = "0";
  JobDetailData? data;
  JobDetail? dataModel;
  RxBool isLoading = true.obs;
  String className = "JobDetailController";
  JobDetailProvider provider = JobDetailProvider();

  TextEditingController reasonTextEditingController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    orderId = Get.parameters[AppParamsKey.paramJobId].toString();
    from = Get.parameters[AppParamsKey.paramFrom].toString();
    fetchJobDetailJson();
    fetchJobDetail();
  }

  void fetchJobDetailJson() {
    CustomLogger().print('fetchJobDetail for id:$orderId', lineNumber: 39);
    provider.getJobDetail(orderId).then((value) {
      data = value!.data;
      CustomLogger().print(jsonEncode(data), lineNumber: 42);
    });
  }

  void fetchJobDetail() {
    isLoading(true);
    CustomLogger().print('fetchJobDetail for id:$orderId', lineNumber: 48);
    provider.fetchJobDetail(orderId: orderId).then((value) {
      if (value.getException != null) {
        ApiExceptionUtils().apiException(
            error: value.getException, className: className, lineNumber: 52);
      } else {
        dataModel = value.data;
        CustomLogger().print(jsonEncode(dataModel), lineNumber: 55);
        isLoading(false);
      }
    });
  }

  String toolbarTitleText() {
    if (dataModel != null) {
      if (dataModel!.orderStatusId == AppConstants.processingStatusId) {
        return LocaleKeys.assigned.tr;
      } else if (dataModel!.orderStatusId == AppConstants.shippedStatusId &&
          dataModel!.shippingStatusId == AppConstants.shippingShippedStatusId) {
        return LocaleKeys.orderPickedUp.tr;
      } else if (dataModel!.orderStatusId == AppConstants.shippedStatusId &&
          dataModel!.shippingStatusId == AppConstants.inTransitStatusId) {
        return LocaleKeys.inTransit.tr;
      }
    }
    return "";
  }

  String buttonTitleText() {
    if (dataModel != null) {
      if (dataModel!.orderStatusId == AppConstants.shippedStatusId &&
          dataModel!.shippingStatusId == AppConstants.shippingShippedStatusId) {
        return LocaleKeys.startJourney.tr;
      } else if (dataModel!.orderStatusId == AppConstants.shippedStatusId &&
          dataModel!.shippingStatusId == AppConstants.inTransitStatusId) {
        return LocaleKeys.jobCompleted.tr;
      } else if (dataModel!.orderStatusId == AppConstants.processingStatusId) {
        return LocaleKeys.orderPickedUp.tr;
      }
      //no need of this condition
      else if (dataModel!.shippingStatusId ==
          AppConstants.shippingCompletedStatusId) {
        return LocaleKeys.congratulations.tr;
      }
    }
    return "Default";
  }

  void buttonPressed() {
    CustomLogger().print(
        "buttonPressed() orderStatus: ${dataModel!.orderStatusId} && "
        "shipment Status: ${dataModel!.shippingStatusId}",
        className: className,
        lineNumber: 85);

    if (dataModel!.orderStatusId == AppConstants.processingStatusId) {
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
    } else if (dataModel!.orderStatusId == AppConstants.shippedStatusId &&
        dataModel!.shippingStatusId == AppConstants.inTransitStatusId) {
      jobStatusChangeToDeliveredAPI();
      // navigateWithMessage("Job status changed to reached");
    } else if (dataModel!.orderStatusId == AppConstants.shippedStatusId &&
        dataModel!.shippingStatusId == AppConstants.shippingShippedStatusId) {
      jobStatusChangeToInTransitAPI();
      // navigateWithMessage("Job status changed to on the way");
    }
    //No need of this condition
    else if (dataModel!.orderStatusId == AppConstants.completedStatusId) {
      NavigationUtils().callJobCompletedScreen();
    }
  }

  void deliveryFailedButtonPressed() {
    CustomLogger().print("Delivery failed pressed",
        className: CustomTrace(trace: StackTrace.current).data,
        lineNumber: 140);
    if (reasonTextEditingController.text.trim().isEmpty) {
      CustomSnackBar.showErrorSnackBar(LocaleKeys.error.tr,
          LocaleKeys.youMustEnterAReasonForFailedDelivery.tr);
      return;
    }
    provider
        .changeStatusToDeliveryFailed(JobFailedInputModel(
            orderId: int.parse(orderId),
            reason: reasonTextEditingController.text))
        .then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 111);
      } else {
        if (response.data!.statusCode == 200) {
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}",
              backgroundColor: Colors.white, textColor: AppColor.colorPrimary);
          fetchJobDetail();
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.success.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.success.tr,
            LocaleKeys.somethingWentWrong.tr,
          );
        }
      }
    });
  }

  void jobStatusChangeToShippedOrPickedAPI() {
    // apiCalling(true);
    provider.changeStatusToShippedOrPicked(int.parse(orderId)).then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 171);
      } else {
        if (response.data!.statusCode == 200) {
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}",
              backgroundColor: Colors.white, textColor: AppColor.colorPrimary);
          fetchJobDetail();
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.success.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.success.tr,
            LocaleKeys.somethingWentWrong.tr,
          );
        }
      }
      // apiCalling(false);
    });
  }

  void jobStatusChangeToInTransitAPI() {
    // apiCalling(true);
    provider.changeStatusToInTransit(int.parse(orderId)).then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 201);
      } else {
        if (response.data!.statusCode == 200) {
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}",
              backgroundColor: Colors.white, textColor: AppColor.colorPrimary);
          fetchJobDetail();
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.success.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.success.tr,
            LocaleKeys.somethingWentWrong.tr,
          );
        }
      }
      // apiCalling(false);
    });
  }

  void jobStatusChangeToDeliveredAPI() {
    // apiCalling(true);
    provider.changeStatusToDelivered(int.parse(orderId)).then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException,
            className: className,
            lineNumber: 231);
      } else {
        if (response.data!.statusCode == 200) {
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data!.message}",
              backgroundColor: Colors.white, textColor: AppColor.colorPrimary);
          NavigationUtils().callJobCompletedScreen();
        } else if (response.data!.statusCode == 400) {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.success.tr,
            "${response.data!.message}",
          );
        } else {
          CustomSnackBar.showErrorSnackBar(
            LocaleKeys.success.tr,
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
