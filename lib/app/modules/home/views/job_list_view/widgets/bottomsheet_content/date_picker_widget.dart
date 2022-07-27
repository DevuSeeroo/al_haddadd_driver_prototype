import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class DatePickerWidget extends StatelessWidget {
  const DatePickerWidget({
    Key? key,
    required this.hintText,
    required this.editingController,
    required this.onTap,
  }) : super(key: key);

  final String hintText;
  final TextEditingController editingController;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  decoration: InputDecoration(
                    hintText: hintText,
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.only(
                        left: 10, right: 10, top: 2, bottom: 10),
                    // contentPadding: EdgeInsets.zero,
                  ),
                  controller: editingController,
                  onTap: () {
                    onTap();
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
        ));
  }
}
