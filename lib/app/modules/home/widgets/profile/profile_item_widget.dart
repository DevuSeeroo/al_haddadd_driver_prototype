import 'package:alhaddad_driver/app/widgets/icons/svg_icon_widget.dart';
import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  const ProfileItemWidget({
    Key? key,
    required this.assetUrl,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  final String assetUrl;
  final String title;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        onTap();
      },
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(top: 20, bottom: 20),
        child: Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            SvgIconWidget(
              assetUrl: assetUrl,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 10),
            Text(title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          ],
        ),
      ),
    );
  }
}
