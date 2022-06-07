class JobListInputParam {
  int? id;
  String? customerName;
  List<int>? orderStatus;
  int? pageNumber;
  int? pageSize;

  JobListInputParam({this.id, this.customerName, this.orderStatus});

  JobListInputParam.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    customerName = json['customer_name'];
    orderStatus = json['order_status'];
    pageNumber = json['page_number'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['customer_name'] = customerName;
    data['order_status'] = orderStatus;
    data['page_number'] = pageNumber;
    data['page_size'] = pageSize;
    data['page_number'] = 1;
    data['page_size'] = 5;
    return data;
  }
}
