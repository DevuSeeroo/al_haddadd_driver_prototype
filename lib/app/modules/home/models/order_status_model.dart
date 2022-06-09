import 'package:get/get.dart';

class OrderStatusModel {
  int? orderStatusId;
  String? orderStatus;
  RxBool isSelected = false.obs;
  OrderStatusModel(this.orderStatusId, this.orderStatus, this.isSelected);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_status_id'] = orderStatusId;
    data['order_status'] = orderStatus;
    data['is_selected'] = isSelected.value;
    return data;
  }
}
