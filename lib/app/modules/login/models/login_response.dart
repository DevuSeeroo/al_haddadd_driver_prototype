class LoginResponse {
  String? username;
  int? customerId;
  String? token;
  CustomerDtls? customerDtls;

  LoginResponse({this.username, this.customerId, this.token, this.customerDtls});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    customerId = json['customer_id'];
    token = json['token'];
    customerDtls = json['customer_dtls'] != null ? new CustomerDtls.fromJson(json['customer_dtls']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['customer_id'] = this.customerId;
    data['token'] = this.token;
    if (this.customerDtls != null) {
      data['customer_dtls'] = this.customerDtls!.toJson();
    }
    return data;
  }
}

class CustomerDtls {
  String? email;

  String? username;
  String? firstName;
  String? lastName;
  String? phone;

  int? id;
  CustomProperties? customProperties;

  CustomerDtls({this.email, this.username,  this.firstName,  this.lastName,  this.phone,  this.id, this.customProperties});

  CustomerDtls.fromJson(Map<String, dynamic> json) {
    email = json['Email'];

    username = json['Username'];

    firstName = json['FirstName'];

    lastName = json['LastName'];

    phone = json['Phone'];

    id = json['Id'];

    customProperties = json['CustomProperties'] != null ? new CustomProperties.fromJson(json['CustomProperties']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Email'] = this.email;

    data['Username'] = this.username;

    data['FirstName'] = this.firstName;

    data['LastName'] = this.lastName;

    data['Phone'] = this.phone;

    data['Id'] = this.id;

    if (this.customProperties != null) {
      data['CustomProperties'] = this.customProperties!.toJson();
    }
    return data;
  }
}

class AttachedDocuments {
  String? attachedDoc;
  int? customerId;
  int? id;

  AttachedDocuments({this.attachedDoc, this.customerId, this.id});

  AttachedDocuments.fromJson(Map<String, dynamic> json) {
    attachedDoc = json['AttachedDoc'];
    customerId = json['CustomerId'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['AttachedDoc'] = this.attachedDoc;
    data['CustomerId'] = this.customerId;
    data['Id'] = this.id;
    return data;
  }
}

class CustomProperties {


  CustomProperties();

CustomProperties.fromJson(Map<String, dynamic> json);

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  return data;
}
}
