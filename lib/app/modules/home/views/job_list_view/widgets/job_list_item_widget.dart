import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/modules/home/models/job_list_model.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/utils/custom_logger.dart';
import 'package:alhaddad_driver/app/utils/date_utlis.dart';
import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dot_widget.dart';
import 'first_row_item.dart';
import 'second_row_item.dart';

class JobListItemWidget extends StatelessWidget {
  const JobListItemWidget({
    Key? key,
    required this.jobItem,
    required this.jobSelectedIndex,
  }) : super(key: key);

  final JobList jobItem;
  final int jobSelectedIndex;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationUtils()
            .callJobDetailScreen(id: jobItem.shippingId.toString())
            .then((value) {
          CustomLogger().print("callback invoked", lineNumber: 29);
          Get.find<JobListController>().resetPagination();
          Get.find<JobListController>()
              .fetchJobListAPI(from: "JobDetailBackPressed");
        });
      },
      child: Card(
        color: Colors.white,
        shadowColor: AppColor.hintTextColor,
        elevation: 3,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 20, 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DotWidget(
                      color: AppColor()
                          .getJobBasedColor(jobItem.driverShippingStatusId!)),
                  const SizedBox(width: 20),
                  FirstRowItem(
                    jobId: jobItem.id.toString(),
                    name: (jobItem.shippingAddressFirstName ?? "") +
                        " " +
                        (jobItem.shippingAddressLastName ?? ""),
                    address: jobItem.shippingAddressPhoneNumber ?? "",
                  ),
                  const SizedBox(width: 10),
                  SecondRowItem(
                    statusColor: AppColor().getJobBasedColor(
                        jobItem.driverShippingStatusId ??
                            AppConstants.shippingDriverAssignedStatusId),
                    statusMessage: Get.find<JobListController>()
                        .statusMessageNew(jobItem.driverShippingStatusId ??
                            AppConstants.shippingDriverAssignedStatusId),
                    time: "",
                    // date: CustomDateUtils().dateToDisplay(
                    //     apiDate: jobItem.shippingDeliveryAssignDate ?? ""),
                  ),
                ],
              ),
              DateWidget(
                title: jobSelectedIndex != AppConstants.jobHistoryIndex
                    ? LocaleKeys.expectedDeliveryDate.tr
                    : jobItem.driverShippingStatusId ==
                            AppConstants.shippingPackageReturnedStatusId
                        ? LocaleKeys.returnedDate.tr
                        : LocaleKeys.deliveredDate.tr,
                date: jobSelectedIndex != AppConstants.jobHistoryIndex
                    ? CustomDateUtils().dateToDisplay(
                        apiDate: jobItem.shippingDeliveryAssignDate ?? "")
                    : CustomDateUtils().dateToDisplay(
                        apiDate: jobItem.shippingDeliveredDate ?? ""),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DateWidget extends StatelessWidget {
  const DateWidget({
    Key? key,
    required this.title,
    this.date,
  }) : super(key: key);

  final String title;
  final String? date;

  @override
  Widget build(BuildContext context) {
    return date != null
        ? Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(35, 0, 20, 15),
            child: RichText(
              text: TextSpan(
                text: title,
                style: const TextStyle(
                  color: AppColor.textColor,
                  fontSize: 15,
                ),
                children: <InlineSpan>[
                  const WidgetSpan(child: SizedBox(width: 10)),
                  TextSpan(
                      text: date,
                      style: const TextStyle(
                          color: AppColor.colorPrimary,
                          fontSize: 17,
                          fontWeight: FontWeight.w400)),
                ],
              ),
            ),
          )
        : const SizedBox(height: 15);
  }
}
