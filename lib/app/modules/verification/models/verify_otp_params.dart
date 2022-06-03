class VerifyOtpParams {
  String? phoneNumber;
  String? otp;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone_number'] = this.phoneNumber;
    data['otp'] = this.otp;
    data['process_type_id'] = 2;
    return data;
  }
}
