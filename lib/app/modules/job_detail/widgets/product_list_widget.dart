import 'package:alhaddad_driver/app/modules/job_detail/widgets/product_item_widget.dart';
import 'package:flutter/material.dart';

import '../../../utils/app_color.dart';
import '../controllers/job_detail_controller.dart';

class ProductListWidget extends StatelessWidget {
  const ProductListWidget({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final JobDetailController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      clipBehavior: Clip.none,
      color: AppColor.productListBackgroundColor,
      child: ListView.separated(
        padding: const EdgeInsets.only(top: 20, left: 20, bottom: 20),
        scrollDirection: Axis.horizontal,
        itemCount: controller.data!.products!.length,
        clipBehavior: Clip.none,
        itemBuilder: (context, index) {
          return ProductItemWidget(
            product: controller.data!.products![index],
            index: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(width: 10);
        },
      ),
    );
  }
}
