class JobListInputParam {
  int? id;
  String? customerName;
  String? orderStatus;

  JobListInputParam({this.id, this.customerName, this.orderStatus});

  JobListInputParam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    orderStatus = json['order_status'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['customer_name'] = customerName;
    data['order_status'] = orderStatus;
    return data;
  }
}
