class JobDetailModel {
  String? status;
  String? message;
  JobDetailData? data;

  JobDetailModel({this.status, this.message, this.data});

  JobDetailModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? JobDetailData?.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    data['data'] = this.data?.toJson();
    return data;
  }
}

class JobDetailData {
  String? jobId;
  String? paymentMethod;
  double? total;
  String? date;
  String? time;
  String? userName;
  String? address;
  String? mobile;
  String? alternateMobile;
  String? latitude;
  String? longitude;
  int? orderStatus;
  List<Products>? products;

  JobDetailData(
      {this.jobId,
      this.paymentMethod,
      this.total,
      this.date,
      this.time,
      this.userName,
      this.address,
      this.mobile,
      this.alternateMobile,
      this.orderStatus,
      this.products});

  JobDetailData.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    paymentMethod = json['payment_method'];
    total = json['total'];
    date = json['date'];
    time = json['time'];
    userName = json['user_name'];
    address = json['address'];
    mobile = json['mobile'];
    alternateMobile = json['alternate_mobile'];
    orderStatus = json['order_status'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products?.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['job_id'] = jobId;
    data['payment_method'] = paymentMethod;
    data['total'] = total;
    data['date'] = date;
    data['time'] = time;
    data['user_name'] = userName;
    data['address'] = address;
    data['mobile'] = mobile;
    data['alternate_mobile'] = alternateMobile;
    data['order_status'] = orderStatus;
    if (products != null) {
      data['products'] = products?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  int? productId;
  String? productName;
  String? productImage;
  String? productAmount;
  int? totalItems;

  Products(
      {this.productId,
      this.productName,
      this.productImage,
      this.productAmount,
      this.totalItems});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productImage = json['product_image'];
    productAmount = json['product_amount'];
    totalItems = json['total_items'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_image'] = productImage;
    data['product_amount'] = productAmount;
    data['total_items'] = totalItems;
    return data;
  }
}
