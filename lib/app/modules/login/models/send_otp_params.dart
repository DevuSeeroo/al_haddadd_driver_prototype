class SendOtpParams {
  String? phoneNumber;
  SendOtpParams(this.phoneNumber);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['phone_number'] = phoneNumber;
    data['process_type_id'] = 2;
    return data;
  }
}
