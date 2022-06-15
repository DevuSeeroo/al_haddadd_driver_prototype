import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/modules/home/models/job_list_model.dart';
import 'package:alhaddad_driver/app/modules/home/widgets/home_appbar.dart';
import 'package:alhaddad_driver/app/utils/app_constants.dart';
import 'package:alhaddad_driver/app/widgets/views/empty_view.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/loading_view.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'custom_vertical_divider.dart';
import 'job_list_item_widget.dart';
import 'search_filter_widget.dart';
import 'tab_title_row_widget.dart';

class JobListContent extends StatelessWidget {
  const JobListContent({
    Key? key,
    required this.jobList,
    this.isShowSearch = false,
    this.onSearchTextChanged,
    required this.controller,
  }) : super(key: key);

  final List<JobList> jobList;
  final bool isShowSearch;
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
                  SearchFilterWidget(
                      onSearchTextChanged: onSearchTextChanged,
                      controller: controller),
                JobListOrEmptyView(
                    jobList: jobList, isShowSearch: isShowSearch),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class JobListOrEmptyView extends StatelessWidget {
  const JobListOrEmptyView({
    Key? key,
    required this.jobList,
    required this.isShowSearch,
  }) : super(key: key);

  final List<JobList> jobList;
  final bool isShowSearch;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(
      () => jobList.isNotEmpty
          ? ListView.separated(
              itemCount: jobList.length,
              itemBuilder: (context, index) {
                JobList jobItem = jobList[index];
                return JobListItemWidget(
                  jobItem: jobItem,
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 10);
              },
            )
          : EmptyView(
              subTitle: LocaleKeys.noItemsFound.tr,
              title: isShowSearch ? LocaleKeys.search.tr : LocaleKeys.sorry.tr),
    ));
  }
}
