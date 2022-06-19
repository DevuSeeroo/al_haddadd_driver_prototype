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
      {phoneNumber,
      otp,
      isVerified,
      processTypeId,
      createdOnUTC,
      updatedOnUTC,
      expiryOnUTC,
      apiResponseModel});

  SendOtpResponse.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['PhoneNumber'];
    otp = json['OTP'];
    isVerified = json['IsVerified'];
    processTypeId = json['ProcessTypeId'];
    createdOnUTC = json['CreatedOnUTC'];
    updatedOnUTC = json['UpdatedOnUTC'];
    expiryOnUTC = json['ExpiryOnUTC'];
    apiResponseModel = json['APIResponseModel'] != null
        ? APIResponseModel.fromJson(json['APIResponseModel'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PhoneNumber'] = phoneNumber;
    data['OTP'] = otp;
    data['IsVerified'] = isVerified;
    data['ProcessTypeId'] = processTypeId;
    data['CreatedOnUTC'] = createdOnUTC;
    data['UpdatedOnUTC'] = updatedOnUTC;
    data['ExpiryOnUTC'] = expiryOnUTC;
    if (apiResponseModel != null) {
      data['APIResponseModel'] = apiResponseModel!.toJson();
    }
    return data;
  }
}

class APIResponseModel {
  String? message;
  String? value;
  bool? status;

  APIResponseModel({message, value, status});

  APIResponseModel.fromJson(Map<String, dynamic> json) {
    message = json['Message'];
    value = json['Value'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Message'] = message;
    data['Value'] = value;
    data['Status'] = status;
    return data;
  }
}
