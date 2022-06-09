import 'package:alhaddad_driver/app/modules/job_detail/models/job_detail_model.dart';
import 'package:alhaddad_driver/app/widgets/images/broken_image.dart';
import 'package:alhaddad_driver/app/widgets/images/curved_image_view.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(
      {Key? key, required this.product, required this.index, this.padding})
      : super(key: key);

  final Items product;
  final int index;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColor.colorShadow,
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: Offset(1.0, 1.0), // shadow direction: bottom right
          )
        ],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          ProductImageView(productImage: "product"),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Column(
              children: [
                Text(
                  product.productName ?? "",
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(product.subTotal ?? "0.0",
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                if ((product.quantity ?? 0) != 0) const SizedBox(height: 5),
                if ((product.quantity ?? 0) != 0)
                  Text(
                      "(${product.quantity} item${(product.quantity ?? 0) <= 1 ? ""
                          "" : "s"})",
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProductImageView extends StatelessWidget {
  const ProductImageView({
    Key? key,
    required this.productImage,
  }) : super(key: key);

  final String productImage;

  @override
  Widget build(BuildContext context) {
    return CustomImageView(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      url: productImage,
      height: 100,
      padding: 0,
    );
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: FadeInImage(
          image: NetworkImage(productImage),
          width: 150,
          height: 100,
          fit: BoxFit.contain,
          placeholderErrorBuilder: (context, error, stackTrace) {
            return const BrokenImage(width: 150, height: 100);
          },
          placeholder: const AssetImage(Assets.iconsLogoIcon),
          imageErrorBuilder: (context, error, stackTrace) {
            return const BrokenImage(width: 150, height: 100);
          },
        ));
  }
}
