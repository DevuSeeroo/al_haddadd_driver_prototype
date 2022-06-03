class SendOtpResponse {
  String? phoneNumber;
  String? otp;
  int? isVerified;
  int? processTypeId;
  String? createdOnUTC;
  String? updatedOnUTC;
  String? expiryOnUTC;
  APIResponseModel? apiResponseModel;

  SendOtpResponse(
      {this.phoneNumber,
      this.otp,
      this.isVerified,
      this.processTypeId,
      this.createdOnUTC,
      this.updatedOnUTC,
      this.expiryOnUTC,
      this.apiResponseModel});

  SendOtpResponse.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['PhoneNumber'];
    otp = json['OTP'];
    isVerified = json['IsVerified'];
    processTypeId = json['ProcessTypeId'];
    createdOnUTC = json['CreatedOnUTC'];
    updatedOnUTC = json['UpdatedOnUTC'];
    expiryOnUTC = json['ExpiryOnUTC'];
    apiResponseModel = json['APIResponseModel'] != null
        ? new APIResponseModel.fromJson(json['APIResponseModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PhoneNumber'] = this.phoneNumber;
    data['OTP'] = this.otp;
    data['IsVerified'] = this.isVerified;
    data['ProcessTypeId'] = this.processTypeId;
    data['CreatedOnUTC'] = this.createdOnUTC;
    data['UpdatedOnUTC'] = this.updatedOnUTC;
    data['ExpiryOnUTC'] = this.expiryOnUTC;
    if (this.apiResponseModel != null) {
      data['APIResponseModel'] = this.apiResponseModel!.toJson();
    }
    return data;
  }
}

class APIResponseModel {
  String? message;
  String? value;
  bool? status;

  APIResponseModel({this.message, this.value, this.status});

  APIResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    value = json['Value'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Message'] = this.message;
    data['Value'] = this.value;
    data['Status'] = this.status;
    return data;
  }
}
