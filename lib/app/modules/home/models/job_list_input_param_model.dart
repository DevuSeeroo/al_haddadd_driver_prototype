class JobListInputParam {
  String? searchKey;
  String? fromDate;
  String? toDate;
  List<int>? orderStatus;
  int? pageNumber;
  int? pageSize;

  JobListInputParam(
      {this.toDate, this.searchKey, this.fromDate, this.orderStatus});

  JobListInputParam.fromJson(Map<String, dynamic> json) {
    toDate = json['delivery_date_assigned_to'];
    searchKey = json['search_key'];
    fromDate = json['delivery_date_assigned_from'];
    orderStatus = json['order_status'];
    pageNumber = json['page_number'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['delivery_date_assigned_to'] = toDate;
    data['search_key'] = searchKey;
    data['delivery_date_assigned_from'] = fromDate;
    if (orderStatus != null && orderStatus!.isEmpty) {
      data['order_status'] = null;
    } else {
      data['order_status'] = orderStatus;
    }
    data['page_number'] = pageNumber;
    data['page_size'] = pageSize;
    data['page_number'] = 1;
    data['page_size'] = 5;
    return data;
  }
}
