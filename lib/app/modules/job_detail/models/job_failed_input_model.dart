class JobFailedInputModel {
  int? orderId;
  String? reason;

  JobFailedInputModel({this.reason, this.orderId});

  JobFailedInputModel.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['order_id'] = orderId;
    data['reason'] = reason;
    return data;
  }
}
