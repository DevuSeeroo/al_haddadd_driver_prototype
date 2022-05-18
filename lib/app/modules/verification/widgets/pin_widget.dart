import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_input_text_field/pin_input_text_field.dart';

import '../../../utils/app_color.dart';
import '../../../utils/config.dart';
import '../../../utils/utilities.dart';
import '../controllers/verification_controller.dart';

class PinWidget extends StatelessWidget {
  const PinWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final VerificationController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        PinInputTextFormField(
          onChanged: (value) {
            controller.pin = value;
          },
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              controller.error("OTP shouldn't be empty");
            } else if (value.trim().length != Config.otpLength) {
              controller.error("Enter valid OTP");
            } else {
              controller.error("");
            }
            return null;
          },
          onSubmit: (value) {
            controller.onSubmitted();
          },
          keyboardType: const TextInputType.numberWithOptions(
              decimal: false, signed: false),
          inputFormatters: Utilities().numberFormatter,
          pinLength: 4,
          decoration: buildUnderlineDecoration(),
        ),
        Obx(() {
          return (controller.error.value.isNotEmpty)
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    controller.error.value,
                    style: const TextStyle(color: AppColor.errorColor),
                  ),
                )
              : Container();
        })
      ],
    );
  }

  UnderlineDecoration buildUnderlineDecoration() {
    return UnderlineDecoration(
      colorBuilder: PinListenColorBuilder(AppColor.hintTextColor, Colors.white),
      lineHeight: 2,
      gapSpace: 20,
    );
  }
}
