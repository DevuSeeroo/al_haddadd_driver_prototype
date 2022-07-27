import 'dart:developer';

import 'package:alhaddad_driver/app/widgets/images/broken_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomImageView extends StatelessWidget {
  final double? width;
  final double? height;
  final String url;
  final double? opacity;
  final bool isAssetUrl;
  final double padding;
  final BorderRadius? borderRadius;

  const CustomImageView(
      {Key? key,
      this.width,
      this.height,
      required this.url,
      this.opacity,
      this.isAssetUrl = false,
      this.padding = 2,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? const BorderRadius.all(Radius.circular(10)),
      child: SizedBox(
        height: height,
        width: width,
        child: isAssetUrl ? _buildSvgImageView() : _buildImageView(),
      ),
    );
  }

  Widget _buildSvgImageView() {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
        child: Image.asset(
          url,
          width: width,
          height: height ?? 150.0,
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _buildImageView() {
    log('url is $url');
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: CachedNetworkImage(
        width: width,
        height: height ?? 150.0,
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.contain,
              colorFilter: opacity != null
                  ? ColorFilter.mode(
                      Colors.black.withOpacity(opacity!), BlendMode.srcOver)
                  : null,
            ),
          ),
        ),
        fit: BoxFit.contain,
        placeholder: (context, url) => Container(
            color: Colors.grey[300],
            alignment: Alignment.center,
            child: const SizedBox(
                width: 25.0, height: 25.0, child: Icon(Icons.image_search))),
        errorWidget: (context, url, error) => BrokenImage(
          width: width ?? 150,
          height: height,
        ),
      ),
    );
  }
}
