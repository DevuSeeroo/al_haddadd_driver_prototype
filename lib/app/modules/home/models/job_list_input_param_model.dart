class JobListInputParam {
  String? searchKey;
  String? fromDate;
  String? toDate;
  DateTime? fromDateTime;
  DateTime? toDateTime;
  List<int>? orderStatus;
  List<int>? shippingStatus;
  int? pageNumber;
  int? pageSize;

  JobListInputParam(
      {this.toDate,
      this.toDateTime,
      this.searchKey,
      this.fromDate,
      this.fromDateTime,
      this.orderStatus,
      this.shippingStatus,
      this.pageNumber,
      this.pageSize});

  JobListInputParam.fromJson(Map<String, dynamic> json) {
    toDate = json['delivery_date_assigned_to'];
    fromDate = json['delivery_date_assigned_from'];
    toDateTime = json['delivery_date_assigned_to'];
    fromDateTime = json['delivery_date_assigned_from'];
    searchKey = json['search_key'];
    orderStatus = json['order_status'];
    shippingStatus = json['shipping_status'];
    pageNumber = json['page_number'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['delivery_date_assigned_to'] = toDate;
    // data['delivery_date_assigned_to'] = toDateTime?.toString();
    data['delivery_date_assigned_from'] = fromDate;
    // data['delivery_date_assigned_from'] = fromDateTime?.toString();
    if (searchKey != null && searchKey!.isEmpty) {
      data['search_key'] = null;
    } else {
      data['search_key'] = searchKey;
    }
    if (orderStatus != null && orderStatus!.isEmpty) {
      data['order_status'] = null;
    } else {
      data['order_status'] = orderStatus;
    }
    if (shippingStatus != null && shippingStatus!.isEmpty) {
      data['shipping_status'] = null;
    } else {
      data['shipping_status'] = shippingStatus;
    }
    data['page_number'] = pageNumber;
    data['page_size'] = pageSize;
    return data;
  }
}
