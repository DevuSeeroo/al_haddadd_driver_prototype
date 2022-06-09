import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    Key? key,
    this.onSearchTextChanged,
  }) : super(key: key);
  final Function(String)? onSearchTextChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
          color: AppColor.searchBackgroundColor,
          borderRadius: BorderRadius.circular(80)),
      child: TextField(
        decoration: const InputDecoration(
            isDense: true,
            prefixIcon: Icon(
              Icons.search,
              size: 22,
              color: Colors.black,
            ),
            hintText: "Search",
            hintStyle: TextStyle(color: AppColor.hintTextColor)),
        onChanged: (String val) {
          onSearchTextChanged!(val);
        },
      ),
    );
  }
}
