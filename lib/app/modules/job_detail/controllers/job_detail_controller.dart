import 'dart:async';
import 'dart:convert';

import 'package:alhaddad_driver/app/modules/job_detail/providers/job_detail_provider.dart';
import 'package:alhaddad_driver/app/utils/api_exception_util.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
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

import '../models/job_detail_model.dart';

class JobDetailController extends GetxController {
  String id = "0";
  String from = "0";
  JobDetailData? data;
  RxBool isLoading = true.obs;
  String className = "JobDetailController";
  JobDetailProvider provider = JobDetailProvider();

  @override
  void onInit() {
    super.onInit();
    id = Get.parameters[AppParamsKey.paramJobId].toString();
    from = Get.parameters[AppParamsKey.paramFrom].toString();
    fetchJobDetail();
  }

  void fetchJobDetail() {
    isLoading(true);
    CustomLogger().print('fetchJobDetail for id:$id', lineNumber: 34);
    provider.getJobDetail(id).then((value) {
      data = value!.data;
      CustomLogger().print(jsonEncode(data), lineNumber: 37);
      Timer.periodic(const Duration(seconds: 2), (timer) {
        isLoading(false);
      });
    });
  }

  String buttonTitleText() {
    if (data != null) {
      if (data!.orderStatus == AppConstants.jobPickedUp) {
        return LocaleKeys.startJourney.tr;
      } else if (data!.orderStatus == AppConstants.jobOnGoing) {
        return LocaleKeys.reached.tr;
      } else if (data!.orderStatus == AppConstants.jobNotStarted) {
        return LocaleKeys.orderPickedUp.tr;
      } else if (data!.orderStatus == AppConstants.jobReached) {
        return LocaleKeys.jobCompleted.tr;
      }
    }
    return LocaleKeys.orderPickedUp.tr;
  }

  void buttonPressed() {
    CustomLogger().print("buttonPressed() orderStatus: ${data!.orderStatus}",
        className: className, lineNumber: 65);

    ///should implement status based API
    jobStatusChangeAPI();
    if (data!.orderStatus == AppConstants.jobNotStarted) {
      CustomBottomSheet.showCustomBottomSheetWithMargin(
        TitleSubtitleBottomSheetContent(
          title: LocaleKeys.orderPickedUp.tr,
          subtitle: LocaleKeys.areYouSureYouWantToProceed.tr,
          positiveButtonPressed: () {
            navigateWithMessage("Job status changed to order picked up");
          },
          negativeButtonPressed: () {
            navigateWithMessage();
          },
        ),
      );
    } else if (data!.orderStatus == AppConstants.jobReached) {
      NavigationUtils().callJobCompletedScreen();
    } else if (data!.orderStatus == AppConstants.jobOnGoing) {
      navigateWithMessage("Job status changed to reached");
    } else if (data!.orderStatus == AppConstants.jobPickedUp) {
      navigateWithMessage("Job status changed to on the way");
    }
  }

  void jobStatusChangeAPI() {
    // apiCalling(true);
    provider.jobStatusChange(110).then((response) {
      if (response.getException != null) {
        ApiExceptionUtils().apiException(
            error: response.getException, className: className, lineNumber: 47);
      } else {
        if (response.data!.statusCode == 200) {
          CustomSnackBar.showSuccessSnackBar(
              LocaleKeys.success.tr, "${response.data}",
              backgroundColor: Colors.white, textColor: AppColor.colorPrimary);
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
