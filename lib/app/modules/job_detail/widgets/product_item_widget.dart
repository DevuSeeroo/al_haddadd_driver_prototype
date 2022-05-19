import 'package:alhaddad_driver/app/widgets/images/broken_image.dart';
import 'package:alhaddad_driver/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../models/job_detail_model.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget(
      {Key? key, required this.product, required this.index, this.padding})
      : super(key: key);

  final Products product;
  final int index;
  final double? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          ProductImageView(product: product),
          Container(
            padding:
                const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 15),
            child: Column(
              children: [
                Text(
                  product.productName ?? "",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black45,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(product.productAmount ?? "0.0",
                    style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                if ((product.totalItems ?? 0) != 0) const SizedBox(height: 5),
                if ((product.totalItems ?? 0) != 0)
                  Text(
                      "(${product.totalItems} item${(product.totalItems ?? 0) <= 1 ? "" : "s"})",
                      style: const TextStyle(
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
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
    required this.product,
  }) : super(key: key);

  final Products product;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: FadeInImage(
          image: NetworkImage(product.productImage ?? ""),
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
