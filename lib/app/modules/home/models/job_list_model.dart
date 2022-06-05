class JobListResponse {
  List<JobList>? jobList;

  JobListResponse({this.jobList});

  JobListResponse.fromJson(Map<String, dynamic> json) {
    if (json['job_list'] != null) {
      jobList = <JobList>[];
      json['job_list'].forEach((v) {
        jobList?.add(JobList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (jobList != null) {
      data['job_list'] = jobList?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class JobList {
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
  String? rewardPointsHistoryEntryId;
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
  int? id;

  JobList(
      {this.orderGuid,
      this.storeId,
      this.customerId,
      this.billingAddressId,
      this.shippingAddressId,
      this.pickupAddressId,
      this.pickupInStore,
      this.orderStatusId,
      this.shippingStatusId,
      this.paymentStatusId,
      this.paymentMethodSystemName,
      this.customerCurrencyCode,
      this.currencyRate,
      this.customerTaxDisplayTypeId,
      this.vatNumber,
      this.orderSubtotalInclTax,
      this.orderSubtotalExclTax,
      this.orderSubTotalDiscountInclTax,
      this.orderSubTotalDiscountExclTax,
      this.orderShippingInclTax,
      this.orderShippingExclTax,
      this.paymentMethodAdditionalFeeInclTax,
      this.paymentMethodAdditionalFeeExclTax,
      this.taxRates,
      this.orderTax,
      this.orderDiscount,
      this.orderTotal,
      this.refundedAmount,
      this.rewardPointsHistoryEntryId,
      this.checkoutAttributeDescription,
      this.checkoutAttributesXml,
      this.customerLanguageId,
      this.affiliateId,
      this.customerIp,
      this.allowStoringCreditCardNumber,
      this.cardType,
      this.cardName,
      this.cardNumber,
      this.maskedCreditCardNumber,
      this.cardCvv2,
      this.cardExpirationMonth,
      this.cardExpirationYear,
      this.authorizationTransactionId,
      this.authorizationTransactionCode,
      this.authorizationTransactionResult,
      this.captureTransactionId,
      this.captureTransactionResult,
      this.subscriptionTransactionId,
      this.paidDateUtc,
      this.shippingMethod,
      this.shippingRateComputationMethodSystemName,
      this.customValuesXml,
      this.deleted,
      this.createdOnUtc,
      this.customOrderNumber,
      this.redeemedRewardPointsEntryId,
      this.merchantReference,
      this.grantTotal,
      this.paymentResponseMessage,
      this.paymentResponseCode,
      this.customerPaymentIp,
      this.fortId,
      this.tokenName,
      this.paymentStatusReturn,
      this.cardHolderName,
      this.expectedDeliveryDateUtc,
      this.orderStatus,
      this.paymentStatus,
      this.shippingStatus,
      this.customerTaxDisplayType,
      this.id});

  JobList.fromJson(Map<String, dynamic> json) {
    orderGuid = json['OrderGuid'];
    storeId = json['StoreId'];
    customerId = json['CustomerId'];
    billingAddressId = json['BillingAddressId'];
    shippingAddressId = json['ShippingAddressId'];
    pickupAddressId = json['PickupAddressId'];
    pickupInStore = json['PickupInStore'];
    orderStatusId = json['OrderStatusId'];
    shippingStatusId = json['ShippingStatusId'];
    paymentStatusId = json['PaymentStatusId'];
    paymentMethodSystemName = json['PaymentMethodSystemName'];
    customerCurrencyCode = json['CustomerCurrencyCode'];
    currencyRate = json['CurrencyRate'];
    customerTaxDisplayTypeId = json['CustomerTaxDisplayTypeId'];
    vatNumber = json['VatNumber'];
    orderSubtotalInclTax = json['OrderSubtotalInclTax'];
    orderSubtotalExclTax = json['OrderSubtotalExclTax'];
    orderSubTotalDiscountInclTax = json['OrderSubTotalDiscountInclTax'];
    orderSubTotalDiscountExclTax = json['OrderSubTotalDiscountExclTax'];
    orderShippingInclTax = json['OrderShippingInclTax'];
    orderShippingExclTax = json['OrderShippingExclTax'];
    paymentMethodAdditionalFeeInclTax =
        json['PaymentMethodAdditionalFeeInclTax'];
    paymentMethodAdditionalFeeExclTax =
        json['PaymentMethodAdditionalFeeExclTax'];
    taxRates = json['TaxRates'];
    orderTax = json['OrderTax'];
    orderDiscount = json['OrderDiscount'];
    orderTotal = json['OrderTotal'];
    refundedAmount = json['RefundedAmount'];
    rewardPointsHistoryEntryId = json['RewardPointsHistoryEntryId'];
    checkoutAttributeDescription = json['CheckoutAttributeDescription'];
    checkoutAttributesXml = json['CheckoutAttributesXml'];
    customerLanguageId = json['CustomerLanguageId'];
    affiliateId = json['AffiliateId'];
    customerIp = json['CustomerIp'];
    allowStoringCreditCardNumber = json['AllowStoringCreditCardNumber'];
    cardType = json['CardType'];
    cardName = json['CardName'];
    cardNumber = json['CardNumber'];
    maskedCreditCardNumber = json['MaskedCreditCardNumber'];
    cardCvv2 = json['CardCvv2'];
    cardExpirationMonth = json['CardExpirationMonth'];
    cardExpirationYear = json['CardExpirationYear'];
    authorizationTransactionId = json['AuthorizationTransactionId'];
    authorizationTransactionCode = json['AuthorizationTransactionCode'];
    authorizationTransactionResult = json['AuthorizationTransactionResult'];
    captureTransactionId = json['CaptureTransactionId'];
    captureTransactionResult = json['CaptureTransactionResult'];
    subscriptionTransactionId = json['SubscriptionTransactionId'];
    paidDateUtc = json['PaidDateUtc'];
    shippingMethod = json['ShippingMethod'];
    shippingRateComputationMethodSystemName =
        json['ShippingRateComputationMethodSystemName'];
    customValuesXml = json['CustomValuesXml'];
    deleted = json['Deleted'];
    createdOnUtc = json['CreatedOnUtc'];
    customOrderNumber = json['CustomOrderNumber'];
    redeemedRewardPointsEntryId = json['RedeemedRewardPointsEntryId'];
    merchantReference = json['MerchantReference'];
    grantTotal = json['GrantTotal'];
    paymentResponseMessage = json['PaymentResponseMessage'];
    paymentResponseCode = json['PaymentResponseCode'];
    customerPaymentIp = json['CustomerPaymentIp'];
    fortId = json['Fort_id'];
    tokenName = json['Token_name'];
    paymentStatusReturn = json['PaymentStatusReturn'];
    cardHolderName = json['CardHolderName'];
    expectedDeliveryDateUtc = json['ExpectedDeliveryDateUtc'];
    orderStatus = json['OrderStatus'];
    paymentStatus = json['PaymentStatus'];
    shippingStatus = json['ShippingStatus'];
    customerTaxDisplayType = json['CustomerTaxDisplayType'];
    id = json['Id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['OrderGuid'] = orderGuid;
    data['StoreId'] = storeId;
    data['CustomerId'] = customerId;
    data['BillingAddressId'] = billingAddressId;
    data['ShippingAddressId'] = shippingAddressId;
    data['PickupAddressId'] = pickupAddressId;
    data['PickupInStore'] = pickupInStore;
    data['OrderStatusId'] = orderStatusId;
    data['ShippingStatusId'] = shippingStatusId;
    data['PaymentStatusId'] = paymentStatusId;
    data['PaymentMethodSystemName'] = paymentMethodSystemName;
    data['CustomerCurrencyCode'] = customerCurrencyCode;
    data['CurrencyRate'] = currencyRate;
    data['CustomerTaxDisplayTypeId'] = customerTaxDisplayTypeId;
    data['VatNumber'] = vatNumber;
    data['OrderSubtotalInclTax'] = orderSubtotalInclTax;
    data['OrderSubtotalExclTax'] = orderSubtotalExclTax;
    data['OrderSubTotalDiscountInclTax'] = orderSubTotalDiscountInclTax;
    data['OrderSubTotalDiscountExclTax'] = orderSubTotalDiscountExclTax;
    data['OrderShippingInclTax'] = orderShippingInclTax;
    data['OrderShippingExclTax'] = orderShippingExclTax;
    data['PaymentMethodAdditionalFeeInclTax'] =
        paymentMethodAdditionalFeeInclTax;
    data['PaymentMethodAdditionalFeeExclTax'] =
        paymentMethodAdditionalFeeExclTax;
    data['TaxRates'] = taxRates;
    data['OrderTax'] = orderTax;
    data['OrderDiscount'] = orderDiscount;
    data['OrderTotal'] = orderTotal;
    data['RefundedAmount'] = refundedAmount;
    data['RewardPointsHistoryEntryId'] = rewardPointsHistoryEntryId;
    data['CheckoutAttributeDescription'] = checkoutAttributeDescription;
    data['CheckoutAttributesXml'] = checkoutAttributesXml;
    data['CustomerLanguageId'] = customerLanguageId;
    data['AffiliateId'] = affiliateId;
    data['CustomerIp'] = customerIp;
    data['AllowStoringCreditCardNumber'] = allowStoringCreditCardNumber;
    data['CardType'] = cardType;
    data['CardName'] = cardName;
    data['CardNumber'] = cardNumber;
    data['MaskedCreditCardNumber'] = maskedCreditCardNumber;
    data['CardCvv2'] = cardCvv2;
    data['CardExpirationMonth'] = cardExpirationMonth;
    data['CardExpirationYear'] = cardExpirationYear;
    data['AuthorizationTransactionId'] = authorizationTransactionId;
    data['AuthorizationTransactionCode'] = authorizationTransactionCode;
    data['AuthorizationTransactionResult'] = authorizationTransactionResult;
    data['CaptureTransactionId'] = captureTransactionId;
    data['CaptureTransactionResult'] = captureTransactionResult;
    data['SubscriptionTransactionId'] = subscriptionTransactionId;
    data['PaidDateUtc'] = paidDateUtc;
    data['ShippingMethod'] = shippingMethod;
    data['ShippingRateComputationMethodSystemName'] =
        shippingRateComputationMethodSystemName;
    data['CustomValuesXml'] = customValuesXml;
    data['Deleted'] = deleted;
    data['CreatedOnUtc'] = createdOnUtc;
    data['CustomOrderNumber'] = customOrderNumber;
    data['RedeemedRewardPointsEntryId'] = redeemedRewardPointsEntryId;
    data['MerchantReference'] = merchantReference;
    data['GrantTotal'] = grantTotal;
    data['PaymentResponseMessage'] = paymentResponseMessage;
    data['PaymentResponseCode'] = paymentResponseCode;
    data['CustomerPaymentIp'] = customerPaymentIp;
    data['Fort_id'] = fortId;
    data['Token_name'] = tokenName;
    data['PaymentStatusReturn'] = paymentStatusReturn;
    data['CardHolderName'] = cardHolderName;
    data['ExpectedDeliveryDateUtc'] = expectedDeliveryDateUtc;
    data['OrderStatus'] = orderStatus;
    data['PaymentStatus'] = paymentStatus;
    data['ShippingStatus'] = shippingStatus;
    data['CustomerTaxDisplayType'] = customerTaxDisplayType;
    data['Id'] = id;
    return data;
  }
}
