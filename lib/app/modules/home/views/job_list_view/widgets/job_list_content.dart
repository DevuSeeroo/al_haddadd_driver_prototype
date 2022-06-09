import 'dart:ui' as ui;

import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/modules/home/models/job_list_model.dart';
import 'package:alhaddad_driver/app/modules/home/views/job_list_view/widgets/custom_check_box.dart';
import 'package:alhaddad_driver/app/modules/home/views/job_list_view/widgets/search_textfield.dart';
import 'package:alhaddad_driver/app/modules/home/widgets/home_appbar.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_with_style.dart';
import 'package:alhaddad_driver/app/widgets/views/empty_view.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/loading_view.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_vertical_divider.dart';
import 'job_list_item_widget.dart';
import 'tab_title_row_widget.dart';

class JobListContent extends StatelessWidget {
  const JobListContent({
    Key? key,
    required this.jobList,
    this.isShowSearch = false,
    this.onSearchTextChanged,
    this.isHistoryList = false,
    required this.controller,
  }) : super(key: key);

  final List<JobList> jobList;
  final bool isShowSearch;
  final bool isHistoryList;
  final Function(String)? onSearchTextChanged;
  final JobListController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppbar(
            showCustomBackgroundImage: true,
            onTrailingPressed: () {
              controller.datePickerFunction(context, whetherFromDate: false);
            }),
        Expanded(
          child: LoadingView(
            isLoading: controller.isLoading,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TabTitleRowWidget(controller: controller),
                const CustomVerticalDivider(),
                if (controller.jobSelectedIndex.value ==
                    AppConstants.jobHistoryIndex)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: SearchTextField(
                              onSearchTextChanged: onSearchTextChanged)),
                      IconButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            CustomBottomSheet.showCustomBottomSheet(
                                BottomSheetContent(controller: controller));
                          },
                          icon: const Icon(Icons.filter_list_alt))
                    ],
                  ),
                Expanded(
                    child: Obx(
                  () => jobList.isNotEmpty
                      ? ListView.separated(
                          itemCount: jobList.length,
                          itemBuilder: (context, index) {
                            JobList jobItem = jobList[index];
                            return JobListItemWidget(
                              jobItem: jobItem,
                              isHistoryList: isHistoryList,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(height: 10);
                          },
                        )
                      : EmptyView(
                          subTitle: LocaleKeys.noItemsFound.tr,
                          title: isShowSearch
                              ? LocaleKeys.search.tr
                              : LocaleKeys.sorry.tr),
                )),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  const BottomSheetContent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobListController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding:
          const EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Choose Date',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: TextField(
                        readOnly: true,
                        enableInteractiveSelection: true,
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.top,
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: 'From Date',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 10),
                          // contentPadding: EdgeInsets.zero,
                        ),
                        controller: controller.fromDateController,
                        onTap: () {
                          controller.datePickerFunction(context,
                              whetherFromDate: true);
                        },
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 2,
                  )
                ],
              )),
          const SizedBox(height: 10),
          Container(
              height: 40,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  borderRadius: BorderRadius.circular(5.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Directionality(
                      textDirection: ui.TextDirection.ltr,
                      child: TextField(
                        readOnly: true,
                        enableInteractiveSelection: true,
                        maxLines: 1,
                        textAlignVertical: TextAlignVertical.top,
                        textAlign: TextAlign.start,
                        decoration: const InputDecoration(
                          hintText: 'To Date',
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.only(
                              left: 10, right: 10, top: 2, bottom: 10),
                          // contentPadding: EdgeInsets.zero,
                        ),
                        controller: controller.toDateController,
                        onTap: () {
                          controller.datePickerFunction(context,
                              whetherFromDate: false);
                        },
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  const SizedBox(
                    width: 2,
                  )
                ],
              )),
          const SizedBox(height: 10),
          const Text('Choose Status',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          Wrap(
            children: controller.actualOrderStatuses.map((orderStatusModel) {
              return Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Obx(() => CustomCheckBox(
                      isChecked: orderStatusModel.isSelected.value,
                      onTap: () {
                        controller.orderStatusSelected(orderStatusModel);
                      })),
                  Text(orderStatusModel.orderStatus ?? ""),
                ],
              );
            }).toList(),
          ),
          // ListView.builder(
          //   shrinkWrap: true,
          //   itemBuilder: (context, index) {
          //     return Wrap(
          //       crossAxisAlignment: WrapCrossAlignment.center,
          //       children: [
          //         Obx(() => CustomCheckBox(
          //             isChecked: controller
          //                 .actualOrderStatuses[index].isSelected.value,
          //             onTap: () {
          //               controller.orderStatusSelected(index);
          //             })),
          //         Text(controller.actualOrderStatuses[index].orderStatus ?? ""),
          //       ],
          //     );
          //   },
          //   itemCount: controller.actualOrderStatuses.length,
          // ),
        ],
      ),
    );
  }
}
