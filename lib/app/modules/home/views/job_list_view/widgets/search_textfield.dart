import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:alhaddad_driver/generated/locales.g.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.onSearchTextChanged,
    this.onSearchTextSubmitted,
    this.onPressed,
  }) : super(key: key);
  final Function(String)? onSearchTextChanged;
  final Function(String)? onSearchTextSubmitted;
  final Function? onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: AppColor.searchBackgroundColor,
          borderRadius: BorderRadius.circular(80)),
      child: TextField(
        decoration: InputDecoration(
            isDense: true,
            prefixIcon: const Icon(
              Icons.search,
              size: 22,
              color: Colors.black45,
            ),
            suffixIcon: IconButton(
              icon: const Icon(
                Icons.close,
                size: 22,
                color: Colors.black45,
              ),
              onPressed: () {
                onPressed!();
              },
            ),
            hintText: LocaleKeys.search.tr,
            hintStyle: const TextStyle(color: AppColor.hintTextColor)),
        onSubmitted: (value) {
          onSearchTextSubmitted!(value);
        },
        onChanged: (String val) {
          onSearchTextChanged!(val);
        },
      ),
    );
  }
}
