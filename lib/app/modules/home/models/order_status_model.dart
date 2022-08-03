import 'package:get/get.dart';

class ShippingStatusModel {
  int? orderStatusId;
  String? orderStatus;
  RxBool isSelected = false.obs;
  ShippingStatusModel(this.orderStatusId, this.orderStatus, this.isSelected);

  ShippingStatusModel.fromJson(Map<String, dynamic> json) {
    orderStatusId = json['order_status_id'];
    orderStatus = json['order_status'];
    isSelected.value = json['is_selected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_status_id'] = orderStatusId;
    data['order_status'] = orderStatus;
    data['is_selected'] = isSelected.value;
    return data;
  }
}
