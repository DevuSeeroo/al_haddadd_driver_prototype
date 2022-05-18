import 'package:alhaddad_driver/app/modules/home/models/job_list_model.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:flutter/material.dart';

import 'dot_widget.dart';
import 'first_row_item.dart';
import 'second_row_item.dart';

class JobListItemWidget extends StatelessWidget {
  const JobListItemWidget({
    Key? key,
    required this.jobItem,
  }) : super(key: key);

  final JobList jobItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        NavigationUtils().callJobDetailScreen(id: jobItem.jobId ?? "");
      },
      child: Card(
        color: Colors.white,
        shadowColor: AppColor.hintTextColor,
        elevation: 3,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(30, 20, 20, 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DotWidget(color: AppColor().getJobBasedColor(jobItem.jobStatus!)),
              const SizedBox(width: 20),
              FirstRowItem(
                jobId: jobItem.jobId ?? "",
                name: jobItem.name ?? "",
                address: jobItem.address ?? "",
              ),
              const SizedBox(width: 10),
              SecondRowItem(
                statusColor: AppColor().getJobBasedColor(jobItem.jobStatus!),
                statusMessage: jobItem.jobMessage ?? "",
                time: jobItem.time ?? "",
                date: jobItem.date ?? "",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
