import 'package:alhaddad_driver/app/modules/home/widgets/home_appbar.dart';
import 'package:alhaddad_driver/app/modules/home/widgets/job_history/search_textfield.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/views/empty_view.dart';
import '../../models/job_list_model.dart';
import 'job_list_item_widget_json.dart';

class JobListContent extends StatelessWidget {
  const JobListContent({
    Key? key,
    required this.jobList,
    this.isShowSearch = false,
    this.onSearchTextChanged,
  }) : super(key: key);

  final List<JobList> jobList;
  final bool isShowSearch;
  final Function(String)? onSearchTextChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeAppbar(showCustomBackgroundImage: true),
        if (isShowSearch)
          SearchTextField(onSearchTextChanged: onSearchTextChanged),
        Expanded(
            child: Obx(
          () => jobList.isNotEmpty
              ? ListView.separated(
                  itemCount: jobList.length,
                  itemBuilder: (context, index) {
                    JobList jobItem = jobList[index];
                    return JobListItemWidgetJson(jobItem: jobItem);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(height: 10);
                  },
                )
              : EmptyView(
                  subTitle: LocaleKeys.noItemsFound.tr,
                  title: LocaleKeys.search.tr),
        )),
      ],
    );
  }
}
