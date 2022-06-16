import 'package:alhaddad_driver/app/modules/home/controllers/job_list_controller.dart';
import 'package:alhaddad_driver/app/widgets/bottomsheet/bottomsheet_with_style.dart';
import 'package:flutter/material.dart';

import 'filter_bottomsheet_content.dart';
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: SearchTextField(
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
          ),
        ),
        IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              CustomBottomSheet.showCustomBottomSheet(
                  FilterBottomSheetContent(controller: controller));
            },
            icon: const Icon(Icons.filter_list_alt))
      ],
    );
  }
}
