import 'package:alhaddad_driver/app/utils/navigation_utils.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/job_completed_controller.dart';
import '../widgets/job_completed_button_widget.dart';
import '../widgets/job_completed_text_widget.dart';
import '../widgets/job_completed_title_widget.dart';

class JobCompletedView extends GetView<JobCompletedController> {
  const JobCompletedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        NavigationUtils().callHome();
        return true;
      },
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              bottom: 150.0,
              left: 0.0,
              right: 0.0,
              top: 0.0,
              child: Image.asset(Assets.imagesBalloons),
            ),
            Align(
              alignment: Alignment.center,
              child: IntrinsicHeight(
                child: Container(
                    margin:
                        const EdgeInsets.only(left: 30, right: 30, top: 150),
                    width: double.infinity,
                    child: Card(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          JobCompletedTitleWidget(),
                          SizedBox(height: 20),
                          JobCompletedTextWidget(),
                          SizedBox(height: 20),
                          JobCompletedButtonView()
                        ],
                      ),
                    ))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
