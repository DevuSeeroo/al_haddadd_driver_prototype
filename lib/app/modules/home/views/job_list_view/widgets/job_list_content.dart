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
        Obx(() {
          return HomeAppbar(
              enableBackPressed: !controller.isLoading.value,
              showCustomBackgroundImage: true,
              onTrailingPressed: () {
                controller.datePickerFunction(context, whetherFromDate: false);
              });
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
                  jobList: jobList,
                  isShowSearch: isShowSearch,
                  controller: controller,
                ),
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
    required this.controller,
  }) : super(key: key);

  final List<JobList> jobList;
  final bool isShowSearch;
  final JobListController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Obx(
      () => jobList.isNotEmpty
          ? NotificationListener<ScrollNotification>(
              onNotification: controller.onScrollNotification,
              child: ListView.separated(
                itemCount: jobList.length,
                itemBuilder: (context, index) {
                  JobList jobItem = jobList[index];
                  return Column(
                    children: [
                      JobListItemWidget(
                          jobItem: jobItem,
                          jobSelectedIndex: controller.jobSelectedIndex.value),
                      Obx(() => controller.isLoadingMore.value
                          ? index == jobList.length - 1
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child:
                                      paginationProgress(height: 20, width: 20),
                                )
                              : Container()
                          : Container())
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(height: 10);
                },
              ),
            )
          : EmptyView(
              subTitle: controller.jobSelectedIndex.value ==
                      AppConstants.jobHistoryIndex
                  ? LocaleKeys.noJobHistoryFound.tr
                  : controller.jobSelectedIndex.value ==
                          AppConstants.jobPickedIndex
                      ? LocaleKeys.noJobsPicked.tr
                      : LocaleKeys.noJobsFound.tr,
              title: isShowSearch ? LocaleKeys.search.tr : LocaleKeys.sorry.tr),
    ));
  }

  paginationProgress({double? height, double? width}) {
    return Center(
      child: SizedBox(
        height: height ?? 30,
        width: width ?? 30,
        child: const CircularProgressIndicator(
          strokeWidth: 2.0,
        ),
      ),
    );
  }
}
