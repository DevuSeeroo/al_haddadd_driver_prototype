import 'package:alhaddad_driver/app/utils/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/profile_controller.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ProfileController controller;
  @override
  Widget build(BuildContext context) {
    // controller.name(
    //     "Jithin Jyoth Jithin Jyoth Jithin Jyoth Jithin Jyoth Jithin Jyoth Jithin Jyoth Jithin Jyoth");
    return SizedBox(
      width: Get.width,
      child: Card(
        color: Colors.white,
        elevation: 5,
        margin: const EdgeInsets.only(left: 20, right: 20),
        child: Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.center,
          child: Text(
            controller.name.value,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 20, color: AppColor.colorPrimary),
          ),
        ),
      ),
    );
  }
}
