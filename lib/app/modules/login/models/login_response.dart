class LoginResponse {
  String? username;
  int? customerId;
  String? token;
  CustomerDtls? customerDtls;

  LoginResponse({username, customerId, token, customerDtls});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    customerId = json['customer_id'];
    token = json['token'];
    customerDtls = json['customer_dtls'] != null
        ? CustomerDtls.fromJson(json['customer_dtls'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['username'] = username;
    data['customer_id'] = customerId;
    data['token'] = token;
    if (customerDtls != null) {
      data['customer_dtls'] = customerDtls!.toJson();
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

  CustomerDtls(
      {email, username, firstName, lastName, phone, id, customProperties});

  CustomerDtls.fromJson(Map<String, dynamic> json) {
    email = json['Email'];

    username = json['Username'];

    firstName = json['FirstName'];

    lastName = json['LastName'];

    phone = json['Phone'];

    id = json['Id'];

    customProperties = json['CustomProperties'] != null
        ? CustomProperties.fromJson(json['CustomProperties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Email'] = email;

    data['Username'] = username;

    data['FirstName'] = firstName;

    data['LastName'] = lastName;

    data['Phone'] = phone;

    data['Id'] = id;

    if (customProperties != null) {
      data['CustomProperties'] = customProperties!.toJson();
    }
    return data;
  }
}

class AttachedDocuments {
  String? attachedDoc;
  int? customerId;
  int? id;

  AttachedDocuments({attachedDoc, customerId, id});

  AttachedDocuments.fromJson(Map<String, dynamic> json) {
    attachedDoc = json['AttachedDoc'];
    customerId = json['CustomerId'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['AttachedDoc'] = attachedDoc;
    data['CustomerId'] = customerId;
    data['Id'] = id;
    return data;
  }
}

class CustomProperties {
  CustomProperties();

  CustomProperties.fromJson(Map<String, dynamic> json);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    return data;
  }
}
