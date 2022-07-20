class JobListResponse {
  int? totalCount;
  int? totalPages;
  bool? hasPreviousPage;
  bool? hasNextPage;
  List<JobList>? jobList;
  int? pageIndex;
  int? pageSize;

  JobListResponse(
      {totalCount,
      totalPages,
      hasPreviousPage,
      hasNextPage,
      jobList,
      pageIndex,
      pageSize});

  JobListResponse.fromJson(Map<String, dynamic> json) {
    totalCount = json['total_count'];
    totalPages = json['total_pages'];
    hasPreviousPage = json['has_previous_page'];
    hasNextPage = json['has_next_page'];
    if (json['items'] != null) {
      jobList = <JobList>[];
      json['items'].forEach((v) {
        jobList!.add(JobList.fromJson(v));
      });
    }
    pageIndex = json['page_index'];
    pageSize = json['page_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_count'] = totalCount;
    data['total_pages'] = totalPages;
    data['has_previous_page'] = hasPreviousPage;
    data['has_next_page'] = hasNextPage;
    if (jobList != null) {
      data['items'] = jobList!.map((v) => v.toJson()).toList();
    }
    data['page_index'] = pageIndex;
    data['page_size'] = pageSize;
    return data;
  }
}

class JobList {
  OrderDetail? orderDetail;
  String? shippingAddressFirstName;
  String? shippingAddressLastName;
  String? shippingAddressPhoneNumber;
  String? shippingAddressAddress1;
  String? shippingAddressCity;
  String? shippingAddressZipPostalCode;
  String? shippingDeliveryAssignDate;
  String? shippingShippedDate;
  String? shippingDeliveredDate;
  String? shippingDriverAssignedDate;
  int? shippingId;
  int? driverShippingStatusId;
  int? id;

  JobList();

  JobList.fromJson(Map<String, dynamic> json) {
    orderDetail =
        json['orders'] != null ? OrderDetail.fromJson(json['orders']) : null;
    shippingAddressFirstName = json['shipping_address_first_name'];
    shippingAddressLastName = json['shipping_address_last_name'];
    shippingAddressPhoneNumber = json['shipping_address_phone_number'];
    shippingAddressAddress1 = json['shipping_address_address1'];
    shippingAddressCity = json['shipping_address_city'];
    shippingAddressZipPostalCode = json['shipping_address_zip_postal_code'];
    shippingDeliveryAssignDate = json['shipping_delivery_assign_date'];
    shippingShippedDate = json['shipping_shipped_date_date'];
    shippingDeliveredDate = json['shipping_delivered_date'];
    shippingDriverAssignedDate = json['shipping_driver_assigned_date'];

    id = json['id'];
    shippingId = json['shipping_id'];
    driverShippingStatusId = json['driver_shipping_status_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (orderDetail != null) {
      data['orders'] = orderDetail!.toJson();
    }
    data['shipping_address_first_name'] = shippingAddressFirstName;
    data['shipping_address_last_name'] = shippingAddressLastName;
    data['shipping_address_phone_number'] = shippingAddressPhoneNumber;
    data['shipping_address_address1'] = shippingAddressAddress1;
    data['shipping_address_city'] = shippingAddressCity;
    data['shipping_address_zip_postal_code'] = shippingAddressZipPostalCode;
    data['shipping_delivery_assign_date'] = shippingDeliveryAssignDate;
    data['id'] = id;
    return data;
  }
}

class OrderDetail {
  ///to delete
  String? jobId;
  String? name;
  String? phoneNumber;
  int? jobStatus;
  String? jobMessage;
  String? time;
  String? date;

  ///till here

  String? orderGuid;
  int? storeId;
  int? customerId;
  int? billingAddressId;
  int? shippingAddressId;
  int? pickupAddressId;
  bool? pickupInStore;
  int? orderStatusId;
  int? shippingStatusId;
  int? paymentStatusId;
  String? paymentMethodSystemName;
  String? customerCurrencyCode;
  double? currencyRate;
  int? customerTaxDisplayTypeId;
  int? vatNumber;
  double? orderSubtotalInclTax;
  double? orderSubtotalExclTax;
  double? orderSubTotalDiscountInclTax;
  double? orderSubTotalDiscountExclTax;
  double? orderShippingInclTax;
  double? orderShippingExclTax;
  double? paymentMethodAdditionalFeeInclTax;
  double? paymentMethodAdditionalFeeExclTax;
  String? taxRates;
  double? orderTax;
  double? orderDiscount;
  double? orderTotal;
  double? refundedAmount;
  int? rewardPointsHistoryEntryId;
  String? checkoutAttributeDescription;
  String? checkoutAttributesXml;
  double? customerLanguageId;
  int? affiliateId;
  String? customerIp;
  bool? allowStoringCreditCardNumber;
  String? cardType;
  String? cardName;
  String? cardNumber;
  String? maskedCreditCardNumber;
  String? cardCvv2;
  String? cardExpirationMonth;
  String? cardExpirationYear;
  int? authorizationTransactionId;
  String? authorizationTransactionCode;
  String? authorizationTransactionResult;
  String? captureTransactionId;
  String? captureTransactionResult;
  String? subscriptionTransactionId;
  int? paidDateUtc;
  String? shippingMethod;
  String? shippingRateComputationMethodSystemName;
  String? customValuesXml;
  bool? deleted;
  String? createdOnUtc;
  String? customOrderNumber;
  String? redeemedRewardPointsEntryId;
  String? merchantReference;
  String? grantTotal;
  String? paymentResponseMessage;
  String? paymentResponseCode;
  String? customerPaymentIp;
  String? fortId;
  String? tokenName;
  String? paymentStatusReturn;
  String? cardHolderName;
  String? expectedDeliveryDateUtc;
  String? orderStatus;
  String? paymentStatus;
  String? shippingStatus;
  String? customerTaxDisplayType;

  OrderDetail(
      {orderGuid,
      storeId,
      customerId,
      billingAddressId,
      shippingAddressId,
      pickupAddressId,
      pickupInStore,
      orderStatusId,
      shippingStatusId,
      paymentStatusId,
      paymentMethodSystemName,
      customerCurrencyCode,
      currencyRate,
      customerTaxDisplayTypeId,
      vatNumber,
      orderSubtotalInclTax,
      orderSubtotalExclTax,
      orderSubTotalDiscountInclTax,
      orderSubTotalDiscountExclTax,
      orderShippingInclTax,
      orderShippingExclTax,
      paymentMethodAdditionalFeeInclTax,
      paymentMethodAdditionalFeeExclTax,
      taxRates,
      orderTax,
      orderDiscount,
      orderTotal,
      refundedAmount,
      rewardPointsHistoryEntryId,
      checkoutAttributeDescription,
      checkoutAttributesXml,
      customerLanguageId,
      affiliateId,
      customerIp,
      allowStoringCreditCardNumber,
      cardType,
      cardName,
      cardNumber,
      maskedCreditCardNumber,
      cardCvv2,
      cardExpirationMonth,
      cardExpirationYear,
      authorizationTransactionId,
      authorizationTransactionCode,
      authorizationTransactionResult,
      captureTransactionId,
      captureTransactionResult,
      subscriptionTransactionId,
      paidDateUtc,
      shippingMethod,
      shippingRateComputationMethodSystemName,
      customValuesXml,
      deleted,
      createdOnUtc,
      customOrderNumber,
      redeemedRewardPointsEntryId,
      merchantReference,
      grantTotal,
      paymentResponseMessage,
      paymentResponseCode,
      customerPaymentIp,
      fortId,
      tokenName,
      paymentStatusReturn,
      cardHolderName,
      expectedDeliveryDateUtc,
      orderStatus,
      paymentStatus,
      shippingStatus,
      customerTaxDisplayType,
      id});

  OrderDetail.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    name = json['name'];
    name = "John Sebastian";
    phoneNumber = json['phone_number'];
    phoneNumber = "+966 98764312";
    jobStatus = json['job_status'];
    jobMessage = json['job_message'];
    time = json['time'];
    date = json['date'];

    orderGuid = json['OrderGuid'];
    storeId = json['StoreId'];
    customerId = json['CustomerId'];
    billingAddressId = json['BillingAddressId'];
    shippingAddressId = json['ShippingAddressId'];
    pickupAddressId = json['PickupAddressId'];
    orderStatus = json['OrderStatus'];
    orderStatusId = json['OrderStatusId'];
    shippingStatus = json['ShippingStatus'];
    shippingStatusId = json['ShippingStatusId'];
    paymentStatus = json['PaymentStatus'];
    paymentStatusId = json['PaymentStatusId'];
    paymentMethodSystemName = json['PaymentMethodSystemName'];
    customerCurrencyCode = json['CustomerCurrencyCode'];
    currencyRate = json['CurrencyRate'];
    orderSubtotalInclTax = json['OrderSubtotalInclTax'];
    orderSubtotalExclTax = json['OrderSubtotalExclTax'];
    orderSubTotalDiscountInclTax = json['OrderSubTotalDiscountInclTax'];
    orderSubTotalDiscountExclTax = json['OrderSubTotalDiscountExclTax'];
    orderShippingInclTax = json['OrderSubTotalDiscountExclTax'];
    orderShippingExclTax = json['OrderShippingInclTax'];
    orderTax = json['OrderShippingExclTax'];
    orderDiscount = json['OrderTax'];
    orderTotal = json['OrderDiscount'];
    customerLanguageId = json['OrderTotal'];
    paidDateUtc = json['CustomerLanguageId'];
    shippingMethod = json['PaidDateUtc'];
    shippingRateComputationMethodSystemName = json['ShippingMethod'];
    createdOnUtc = json['ShippingRateComputationMethodSystemName'];
    customOrderNumber = json['CreatedOnUtc'];
    merchantReference = json['CustomOrderNumber'];
    grantTotal = json['MerchantReference'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};

    data['job_id'] = jobId;
    data['name'] = name;
    data['phone_number'] = phoneNumber;
    data['job_status'] = jobStatus;
    data['job_message'] = jobMessage;
    data['time'] = time;
    data['date'] = date;

    data['OrderGuid'] = orderGuid;
    data['StoreId'] = storeId;
    data['CustomerId'] = customerId;
    data['BillingAddressId'] = billingAddressId;
    data['ShippingAddressId'] = shippingAddressId;
    data['PickupAddressId'] = pickupAddressId;
    data['OrderStatus'] = orderStatus;
    data['OrderStatusId'] = orderStatusId;
    data['ShippingStatus'] = shippingStatus;
    data['ShippingStatusId'] = shippingStatusId;
    data['PaymentStatus'] = paymentStatus;
    data['PaymentStatusId'] = paymentStatusId;
    data['PaymentMethodSystemName'] = paymentMethodSystemName;
    data['CustomerCurrencyCode'] = customerCurrencyCode;
    data['CurrencyRate'] = currencyRate;
    data['OrderSubtotalInclTax'] = orderSubtotalInclTax;
    data['OrderSubtotalExclTax'] = orderSubtotalExclTax;
    data['OrderSubTotalDiscountInclTax'] = orderSubTotalDiscountInclTax;
    data['OrderSubTotalDiscountExclTax'] = orderSubTotalDiscountExclTax;
    data['OrderShippingInclTax'] = orderShippingInclTax;
    data['OrderShippingExclTax'] = orderShippingExclTax;
    data['OrderTax'] = orderTax;
    data['OrderDiscount'] = orderDiscount;
    data['OrderTotal'] = orderTotal;
    data['CustomerLanguageId'] = customerLanguageId;
    data['PaidDateUtc'] = paidDateUtc;
    data['ShippingMethod'] = shippingMethod;
    data['ShippingRateComputationMethodSystemName'] =
        shippingRateComputationMethodSystemName;
    data['CreatedOnUtc'] = createdOnUtc;
    data['CustomOrderNumber'] = customOrderNumber;
    data['MerchantReference'] = merchantReference;
    data['GrantTotal'] = grantTotal;
    return data;
  }
}
