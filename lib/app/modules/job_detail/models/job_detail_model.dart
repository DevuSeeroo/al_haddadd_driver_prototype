class JobDetail {
  bool? printMode;
  bool? pdfInvoiceDisabled;
  String? customOrderNumber;
  String? createdOn;
  String? orderStatus;
  int? orderStatusId;
  bool? isReOrderAllowed;
  bool? isReturnRequestAllowed;
  bool? isShippable;
  bool? pickupInStore;
  Address? pickupAddress;

  int? shippingStatusId;
  String? shippingStatus;
  Address? shippingAddress;
  dynamic shippingMethod;
  List<Shipments>? shipments;
  Address? billingAddress;
  dynamic vatNumber;
  String? paymentMethod;
  String? paymentMethodStatus;
  bool? canRePostProcessPayment;
  String? orderSubtotal;
  dynamic orderSubTotalDiscount;
  String? orderShipping;
  dynamic paymentMethodAdditionalFee;
  String? checkoutAttributeInfo;
  bool? pricesIncludeTax;
  bool? displayTaxShippingInfo;
  String? tax;
  bool? displayTax;
  bool? displayTaxRates;
  dynamic orderTotalDiscount;
  int? redeemedRewardPoints;
  dynamic redeemedRewardPointsAmount;
  String? orderTotal;
  bool? showSku;
  List<Items>? items;
  List<String>? orderNotes;
  bool? showVendorName;
  int? id;

  JobDetail(
      {this.printMode,
      this.pdfInvoiceDisabled,
      this.customOrderNumber,
      this.createdOn,
      this.orderStatus,
      this.isReOrderAllowed,
      this.isReturnRequestAllowed,
      this.isShippable,
      this.pickupInStore,
      this.pickupAddress,
      this.shippingStatus,
      this.shippingAddress,
      this.shippingMethod,
      this.shipments,
      this.billingAddress,
      this.vatNumber,
      this.paymentMethod,
      this.paymentMethodStatus,
      this.canRePostProcessPayment,
      this.orderSubtotal,
      this.orderSubTotalDiscount,
      this.orderShipping,
      this.paymentMethodAdditionalFee,
      this.checkoutAttributeInfo,
      this.pricesIncludeTax,
      this.displayTaxShippingInfo,
      this.tax,
      this.displayTax,
      this.displayTaxRates,
      this.orderTotalDiscount,
      this.redeemedRewardPoints,
      this.redeemedRewardPointsAmount,
      this.orderTotal,
      this.showSku,
      this.items,
      this.orderNotes,
      this.showVendorName,
      this.id});

  JobDetail.fromJson(Map<String, dynamic> json) {
    printMode = json['print_mode'];
    pdfInvoiceDisabled = json['pdf_invoice_disabled'];
    customOrderNumber = json['custom_order_number'];
    createdOn = json['created_on'];
    orderStatus = json['order_status'];
    orderStatusId = json['order_status_id'];
    isReOrderAllowed = json['is_re_order_allowed'];
    isReturnRequestAllowed = json['is_return_request_allowed'];
    isShippable = json['is_shippable'];
    pickupInStore = json['pickup_in_store'];
    pickupAddress = json['pickup_address'] != null
        ? Address?.fromJson(json['pickup_address'])
        : null;
    shippingStatus = json['shipping_status'];
    shippingStatusId = json['shipping_status_id'];
    shippingAddress = json['shipping_address'] != null
        ? Address?.fromJson(json['shipping_address'])
        : null;
    shippingMethod = json['shipping_method'];
    if (json['shipments'] != null) {
      shipments = <Shipments>[];
      json['shipments'].forEach((v) {
        shipments?.add(Shipments.fromJson(v));
      });
    }
    billingAddress = json['billing_address'] != null
        ? Address?.fromJson(json['billing_address'])
        : null;
    vatNumber = json['vat_number'];
    paymentMethod = json['payment_method'];
    paymentMethodStatus = json['payment_method_status'];
    canRePostProcessPayment = json['can_re_post_process_payment'];
    orderSubtotal = json['order_subtotal'];
    orderSubTotalDiscount = json['order_sub_total_discount'];
    orderShipping = json['order_shipping'];
    paymentMethodAdditionalFee = json['payment_method_additional_fee'];
    checkoutAttributeInfo = json['checkout_attribute_info'];
    pricesIncludeTax = json['prices_include_tax'];
    displayTaxShippingInfo = json['display_tax_shipping_info'];
    tax = json['tax'];

    displayTax = json['display_tax'];
    displayTaxRates = json['display_tax_rates'];
    orderTotalDiscount = json['order_total_discount'];
    redeemedRewardPoints = json['redeemed_reward_points'];
    redeemedRewardPointsAmount = json['redeemed_reward_points_amount'];
    orderTotal = json['order_total'];

    showSku = json['show_sku'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items?.add(Items.fromJson(v));
      });
    }
    if (json['order_notes'] != null) {
      orderNotes = <String>[];
      json['order_notes'].forEach((v) {
        orderNotes?.add(v);
      });
    }
    showVendorName = json['show_vendor_name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['print_mode'] = printMode;
    data['pdf_invoice_disabled'] = pdfInvoiceDisabled;
    data['custom_order_number'] = customOrderNumber;
    data['created_on'] = createdOn;
    data['order_status'] = orderStatus;
    data['is_re_order_allowed'] = isReOrderAllowed;
    data['is_return_request_allowed'] = isReturnRequestAllowed;
    data['is_shippable'] = isShippable;
    data['pickup_in_store'] = pickupInStore;
    if (pickupAddress != null) {
      data['pickup_address'] = pickupAddress?.toJson();
    }
    data['shipping_status'] = shippingStatus;
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress?.toJson();
    }
    data['shipping_method'] = shippingMethod;
    if (shipments != null) {
      data['shipments'] = shipments?.map((v) => v.toJson()).toList();
    }
    if (billingAddress != null) {
      data['billing_address'] = billingAddress?.toJson();
    }
    data['vat_number'] = vatNumber;
    data['payment_method'] = paymentMethod;
    data['payment_method_status'] = paymentMethodStatus;
    data['can_re_post_process_payment'] = canRePostProcessPayment;
    data['order_subtotal'] = orderSubtotal;
    data['order_sub_total_discount'] = orderSubTotalDiscount;
    data['order_shipping'] = orderShipping;
    data['payment_method_additional_fee'] = paymentMethodAdditionalFee;
    data['checkout_attribute_info'] = checkoutAttributeInfo;
    data['prices_include_tax'] = pricesIncludeTax;
    data['display_tax_shipping_info'] = displayTaxShippingInfo;
    data['tax'] = tax;

    data['display_tax'] = displayTax;
    data['display_tax_rates'] = displayTaxRates;
    data['order_total_discount'] = orderTotalDiscount;
    data['redeemed_reward_points'] = redeemedRewardPoints;
    data['redeemed_reward_points_amount'] = redeemedRewardPointsAmount;
    data['order_total'] = orderTotal;

    data['show_sku'] = showSku;
    if (items != null) {
      data['items'] = items?.map((v) => v.toJson()).toList();
    }
    if (orderNotes != null) {
      data['order_notes'] = orderNotes?.toList();
    }
    data['show_vendor_name'] = showVendorName;
    data['id'] = id;
    return data;
  }
}

class Address {
  dynamic firstName;
  dynamic lastName;
  dynamic email;
  bool? companyEnabled;
  bool? companyRequired;
  dynamic company;
  bool? countryEnabled;
  dynamic countryId;
  dynamic countryName;
  bool? stateProvinceEnabled;
  dynamic stateProvinceId;
  dynamic stateProvinceName;
  bool? countyEnabled;
  bool? countyRequired;
  dynamic county;
  bool? cityEnabled;
  bool? cityRequired;
  dynamic city;
  bool? streetAddressEnabled;
  bool? streetAddressRequired;
  dynamic address1;
  bool? streetAddress2Enabled;
  bool? streetAddress2Required;
  dynamic address2;
  bool? zipPostalCodeEnabled;
  bool? zipPostalCodeRequired;
  dynamic zipPostalCode;
  bool? phoneEnabled;
  bool? phoneRequired;
  dynamic phoneNumber;
  bool? faxEnabled;
  bool? faxRequired;
  dynamic faxNumber;
  dynamic formattedCustomAddressAttributes;
  int? id;

  Address(
      {this.firstName,
      this.lastName,
      this.email,
      this.companyEnabled,
      this.companyRequired,
      this.company,
      this.countryEnabled,
      this.countryId,
      this.countryName,
      this.stateProvinceEnabled,
      this.stateProvinceId,
      this.stateProvinceName,
      this.countyEnabled,
      this.countyRequired,
      this.county,
      this.cityEnabled,
      this.cityRequired,
      this.city,
      this.streetAddressEnabled,
      this.streetAddressRequired,
      this.address1,
      this.streetAddress2Enabled,
      this.streetAddress2Required,
      this.address2,
      this.zipPostalCodeEnabled,
      this.zipPostalCodeRequired,
      this.zipPostalCode,
      this.phoneEnabled,
      this.phoneRequired,
      this.phoneNumber,
      this.faxEnabled,
      this.faxRequired,
      this.faxNumber,
      this.formattedCustomAddressAttributes,
      this.id});

  Address.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    companyEnabled = json['company_enabled'];
    companyRequired = json['company_required'];
    company = json['company'];
    countryEnabled = json['country_enabled'];
    countryId = json['country_id'];
    countryName = json['country_name'];
    stateProvinceEnabled = json['state_province_enabled'];
    stateProvinceId = json['state_province_id'];
    stateProvinceName = json['state_province_name'];
    countyEnabled = json['county_enabled'];
    countyRequired = json['county_required'];
    county = json['county'];
    cityEnabled = json['city_enabled'];
    cityRequired = json['city_required'];
    city = json['city'];
    streetAddressEnabled = json['street_address_enabled'];
    streetAddressRequired = json['street_address_required'];
    address1 = json['address1'];
    streetAddress2Enabled = json['street_address2_enabled'];
    streetAddress2Required = json['street_address2_required'];
    address2 = json['address2'];
    zipPostalCodeEnabled = json['zip_postal_code_enabled'];
    zipPostalCodeRequired = json['zip_postal_code_required'];
    zipPostalCode = json['zip_postal_code'];
    phoneEnabled = json['phone_enabled'];
    phoneRequired = json['phone_required'];
    phoneNumber = json['phone_number'];
    faxEnabled = json['fax_enabled'];
    faxRequired = json['fax_required'];
    faxNumber = json['fax_number'];
    formattedCustomAddressAttributes =
        json['formatted_custom_address_attributes'];

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['company_enabled'] = companyEnabled;
    data['company_required'] = companyRequired;
    data['company'] = company;
    data['country_enabled'] = countryEnabled;
    data['country_id'] = countryId;
    data['country_name'] = countryName;
    data['state_province_enabled'] = stateProvinceEnabled;
    data['state_province_id'] = stateProvinceId;
    data['state_province_name'] = stateProvinceName;
    data['county_enabled'] = countyEnabled;
    data['county_required'] = countyRequired;
    data['county'] = county;
    data['city_enabled'] = cityEnabled;
    data['city_required'] = cityRequired;
    data['city'] = city;
    data['street_address_enabled'] = streetAddressEnabled;
    data['street_address_required'] = streetAddressRequired;
    data['address1'] = address1;
    data['street_address2_enabled'] = streetAddress2Enabled;
    data['street_address2_required'] = streetAddress2Required;
    data['address2'] = address2;
    data['zip_postal_code_enabled'] = zipPostalCodeEnabled;
    data['zip_postal_code_required'] = zipPostalCodeRequired;
    data['zip_postal_code'] = zipPostalCode;
    data['phone_enabled'] = phoneEnabled;
    data['phone_required'] = phoneRequired;
    data['phone_number'] = phoneNumber;
    data['fax_enabled'] = faxEnabled;
    data['fax_required'] = faxRequired;
    data['fax_number'] = faxNumber;
    data['id'] = id;
    return data;
  }
}

class Shipments {
  String? trackingNumber;
  String? shippedDate;
  String? deliveryDate;
  String? expectedDeliveryDate;
  String? returnedDate;
  String? driverAssignedDate;
  int? id;
  int? driverCustId;

  Shipments(
      {this.trackingNumber, this.shippedDate, this.deliveryDate, this.id});

  Shipments.fromJson(Map<String, dynamic> json) {
    trackingNumber = json['tracking_number'];
    shippedDate = json['shipped_date'];
    deliveryDate = json['delivery_date'];
    returnedDate = json['returned_date'];
    expectedDeliveryDate = json['driver_assign_dlvry_date_utc'];
    driverAssignedDate = json['driver_assigned_date_utc'];
    id = json['id'];
    driverCustId = json['driver_cust_id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['tracking_number'] = trackingNumber;
    data['shipped_date'] = shippedDate;
    data['delivery_date'] = deliveryDate;
    data['returned_date'] = returnedDate;
    data['driver_assign_dlvry_date_utc'] = expectedDeliveryDate;
    data['driver_assigned_date_utc'] = driverAssignedDate;
    data['driver_cust_id'] = driverCustId;
    data['id'] = id;
    return data;
  }
}

class Items {
  String? orderItemGuid;
  String? sku;
  int? productId;
  String? productName;
  String? productSeName;
  String? unitPrice;
  String? subTotal;
  int? quantity;
  String? attributeInfo;
  dynamic rentalInfo;
  String? vendorName;
  int? downloadId;
  int? licenseId;
  int? id;

  Items(
      {this.orderItemGuid,
      this.sku,
      this.productId,
      this.productName,
      this.productSeName,
      this.unitPrice,
      this.subTotal,
      this.quantity,
      this.attributeInfo,
      this.rentalInfo,
      this.vendorName,
      this.downloadId,
      this.licenseId,
      this.id});

  Items.fromJson(Map<String, dynamic> json) {
    orderItemGuid = json['order_item_guid'];
    sku = json['sku'];
    productId = json['product_id'];
    productName = json['product_name'];
    productSeName = json['product_se_name'];
    unitPrice = json['unit_price'];
    subTotal = json['sub_total'];
    quantity = json['quantity'];
    attributeInfo = json['attribute_info'];
    rentalInfo = json['rental_info'];
    vendorName = json['vendor_name'];
    downloadId = json['download_id'];
    licenseId = json['license_id'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['order_item_guid'] = orderItemGuid;
    data['sku'] = sku;
    data['product_id'] = productId;
    data['product_name'] = productName;
    data['product_se_name'] = productSeName;
    data['unit_price'] = unitPrice;
    data['sub_total'] = subTotal;
    data['quantity'] = quantity;
    data['attribute_info'] = attributeInfo;
    data['rental_info'] = rentalInfo;
    data['vendor_name'] = vendorName;
    data['download_id'] = downloadId;
    data['license_id'] = licenseId;
    data['id'] = id;
    return data;
  }
}
