import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'filter_title_widget.dart';

class TitleCloseWidget extends StatelessWidget {
  const TitleCloseWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobListController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        FilterTitleWidget(title: LocaleKeys.chooseDate.tr),
        IconButton(
            onPressed: () {
              controller.filterCloseClicked();
            },
            icon: const Icon(Icons.close))
      ],
    );
  }
}
