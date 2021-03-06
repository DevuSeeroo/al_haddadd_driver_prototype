import 'package:alhaddad_driver/app/modules/home/controllers/profile_controller.dart';
import 'package:alhaddad_driver/app/modules/home/views/profile_view/widgets/menu_card_widget.dart';
import 'package:alhaddad_driver/app/widgets/views/loaders/custom_loader_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/name_widget.dart';
import 'widgets/profile_toolbar_person_image_widget.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);

  @override
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value
            ? const CustomLoaderWidget()
            : SingleChildScrollView(
                child: SizedBox(
                  height:
                      Get.height - (Get.statusBarHeight / 2) - kToolbarHeight,
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          ProfileToolbarPersonImageWidget(
                            height:
                                (Get.height + (Get.statusBarHeight / 2)) / 1.8,
                          ),

                          ///Logout is in this widget
                          MenuCardWidget(controller: controller)
                        ],
                      ),
                      Positioned(
                          top: (Get.height + (Get.statusBarHeight / 2)) /
                              (controller.name.value.length >= 50
                                  ? 2.1
                                  : controller.name.value.length >= 25
                                      ? 2.1
                                      : 2),
                          child: NameWidget(
                            controller: controller,
                          ))
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
