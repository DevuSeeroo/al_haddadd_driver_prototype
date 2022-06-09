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
  int? customerLanguageId;
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
  String? paidDateUtc;
  String? shippingMethod;
  String? shippingRateComputationMethodSystemName;
  String? customValuesXml;
  bool? deleted;
  String? createdOnUtc;
  String? customOrderNumber;
  String? redeemedRewardPointsEntryId;
  String? merchantReference;
  double? grantTotal;
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
  String? shippingAddressFirstName;
  String? shippingAddressLastName;
  String? shippingAddressPhoneNumber;
  String? shippingAddressAddress1;
  String? shippingAddressCity;
  String? shippingAddressZipPostalCode;
  String? shippingDeliveryAssignDate;
  int? id;

  JobList(
      {jobId,
      name,
      phoneNumber,
      jobStatus,
      jobMessage,
      time,
      date,
      orderGuid,
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

  JobList.fromJson(Map<String, dynamic> json) {
    jobId = json['job_id'];
    name = json['name'];
    name = "John Sebastian";
    phoneNumber = json['phone_number'];
    phoneNumber = "+966 98764312";
    jobStatus = json['job_status'];
    jobMessage = json['job_message'];
    time = json['time'];
    date = json['date'];

    orderGuid = json['order_guid'];
    storeId = json['store_id'];
    customerId = json['customer_id'];
    billingAddressId = json['billing_address_id'];
    shippingAddressId = json['shipping_address_id'];
    pickupAddressId = json['pickup_address_id'];
    orderStatus = json['order_status'];
    orderStatusId = json['order_status_id'];
    shippingStatus = json['shipping_status'];
    shippingStatusId = json['shipping_status_id'];
    paymentStatus = json['payment_status'];
    paymentStatusId = json['payment_status_id'];
    paymentMethodSystemName = json['payment_method_system_name'];
    customerCurrencyCode = json['customer_currency_code'];
    currencyRate = json['currency_rate'];
    orderSubtotalInclTax = json['order_subtotal_incl_tax'];
    orderSubtotalExclTax = json['order_subtotal_excl_tax'];
    orderSubTotalDiscountInclTax = json['order_sub_total_discount_incl_tax'];
    orderSubTotalDiscountExclTax = json['order_sub_total_discount_excl_tax'];
    orderShippingInclTax = json['order_shipping_incl_tax'];
    orderShippingExclTax = json['order_shipping_excl_tax'];
    orderTax = json['order_tax'];
    orderDiscount = json['order_discount'];
    orderTotal = json['order_total'];
    customerLanguageId = json['customer_language_id'];
    paidDateUtc = json['paid_date_utc'];
    shippingMethod = json['shipping_method'];
    shippingRateComputationMethodSystemName =
        json['shipping_rate_computation_method_system_name'];
    createdOnUtc = json['created_on_utc'];
    customOrderNumber = json['custom_order_number'];
    merchantReference = json['merchant_reference'];
    grantTotal = json['grant_total'];
    shippingAddressFirstName = json['shipping_address_first_name'];
    shippingAddressLastName = json['shipping_address_last_name'];
    shippingAddressPhoneNumber = json['shipping_address_phone_number'];
    shippingAddressAddress1 = json['shipping_address_address1'];
    shippingAddressCity = json['shipping_address_city'];
    shippingAddressZipPostalCode = json['shipping_address_zip_postal_code'];
    shippingDeliveryAssignDate = json['shipping_delivery_assign_date'];
    id = json['id'];
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

    data['order_guid'] = orderGuid;
    data['store_id'] = storeId;
    data['customer_id'] = customerId;
    data['billing_address_id'] = billingAddressId;
    data['shipping_address_id'] = shippingAddressId;
    data['pickup_address_id'] = pickupAddressId;
    data['order_status'] = orderStatus;
    data['order_status_id'] = orderStatusId;
    data['shipping_status'] = shippingStatus;
    data['shipping_status_id'] = shippingStatusId;
    data['payment_status'] = paymentStatus;
    data['payment_status_id'] = paymentStatusId;
    data['payment_method_system_name'] = paymentMethodSystemName;
    data['customer_currency_code'] = customerCurrencyCode;
    data['currency_rate'] = currencyRate;
    data['order_subtotal_incl_tax'] = orderSubtotalInclTax;
    data['order_subtotal_excl_tax'] = orderSubtotalExclTax;
    data['order_sub_total_discount_incl_tax'] = orderSubTotalDiscountInclTax;
    data['order_sub_total_discount_excl_tax'] = orderSubTotalDiscountExclTax;
    data['order_shipping_incl_tax'] = orderShippingInclTax;
    data['order_shipping_excl_tax'] = orderShippingExclTax;
    data['order_tax'] = orderTax;
    data['order_discount'] = orderDiscount;
    data['order_total'] = orderTotal;
    data['customer_language_id'] = customerLanguageId;
    data['paid_date_utc'] = paidDateUtc;
    data['shipping_method'] = shippingMethod;
    data['shipping_rate_computation_method_system_name'] =
        shippingRateComputationMethodSystemName;
    data['created_on_utc'] = createdOnUtc;
    data['custom_order_number'] = customOrderNumber;
    data['merchant_reference'] = merchantReference;
    data['grant_total'] = grantTotal;
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
