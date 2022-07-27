import 'package:alhaddad_driver/app/modules/home/widgets/home_appbar.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/material.dart';

class ProfileToolbarPersonImageWidget extends StatelessWidget {
  const ProfileToolbarPersonImageWidget({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: const EdgeInsets.only(bottom: 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(Assets.imagesProfileBg), fit: BoxFit.fill),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HomeAppbar(
            showCustomBackgroundImage: false,
          ),
          Image.asset(
            Assets.imagesProfileBgMan,
            height: 300,
          ),
        ],
      ),
    );
  }
}
