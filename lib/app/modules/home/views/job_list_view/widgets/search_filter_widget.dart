import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_with_style.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomsheet_content/filter_bottomsheet_content.dart';
import 'search_textfield.dart';

class SearchFilterWidget extends StatelessWidget {
  const SearchFilterWidget({
    Key? key,
    required this.onSearchTextChanged,
    required this.controller,
  }) : super(key: key);

  final Function(String p1)? onSearchTextChanged;
  final JobListController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Obx(() => SearchTextField(
                    text: controller.searchKey.value,
                    showClose: controller.searchKey.value.isNotEmpty,
                    onSearchTextChanged: (value) {
                      controller.searchKey(value);
                    },
                    onSearchTextSubmitted: (value) {
                      controller.searchKey(value);
                      controller.applyClicked();
                    },
                    onPressed: () {
                      controller.searchKey("");
                    },
                  )),
            ),
            IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  CustomBottomSheet.showCustomBottomSheet(
                      FilterBottomSheetContent(controller: controller));
                },
                icon: const Icon(Icons.filter_list_alt))
          ],
        ),
        controller.isFilterApplied.value
            ? GestureDetector(
                onTap: () {
                  controller.clearAllClicked(isBackNeeded: true);
                  controller.fetchJobListAPI(from: 'clearAllClicked');
                },
                child: Padding(
                  padding:
                      const EdgeInsets.only(bottom: 8.0, top: 5, right: 10),
                  child: Text(
                    LocaleKeys.clearAll.tr,
                    style: const TextStyle(
                        color: AppColor.colorPrimary,
                        decoration: TextDecoration.underline),
                  ),
                ))
            : Container()
      ],
    );
  }
}
