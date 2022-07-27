class JobFailedInputModel {
  int? shippingId;
  String? reason;

  JobFailedInputModel({this.reason, this.shippingId});

  JobFailedInputModel.fromJson(Map<String, dynamic> json) {
    shippingId = json['order_id'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['order_id'] = shippingId;
    data['reason'] = reason;
    return data;
  }
}
