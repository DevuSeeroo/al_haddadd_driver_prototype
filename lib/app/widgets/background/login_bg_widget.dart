import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../generated/assets.dart';

class LoginBackgroundWidget extends StatelessWidget {
  const LoginBackgroundWidget({
    Key? key,
    required this.child,
    this.topSpace,
  }) : super(key: key);

  final Widget child;
  final double? topSpace;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: SingleChildScrollView(
        child: SizedBox(
          height: Get.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: topSpace),
              Expanded(
                  child: Container(
                alignment: Alignment.bottomCenter,
                child: Image.asset(
                  Assets.iconsSplashLogo,
                  height: 150,
                  width: 150,
                ),
              )),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(Assets.imagesLoginBg),
                          fit: BoxFit.fill),
                    ),
                    padding: const EdgeInsetsDirectional.only(
                        top: 100, start: 20, end: 20),
                    child: child,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
