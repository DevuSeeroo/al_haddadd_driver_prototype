class ViewProfileResponse {
  String? email;
  bool? emailToRevalidate;
  bool? checkUsernameAvailabilityEnabled;
  bool? allowUsersToChangeUsernames;
  bool? usernamesEnabled;
  String? username;
  bool? genderEnabled;
  String? gender;
  bool? firstNameEnabled;
  String? firstName;
  bool? firstNameRequired;
  bool? lastNameEnabled;
  String? lastName;
  bool? lastNameRequired;
  bool? dateOfBirthEnabled;
  String? dateOfBirthDay;
  String? dateOfBirthMonth;
  String? dateOfBirthYear;
  bool? dateOfBirthRequired;
  bool? companyEnabled;
  bool? companyRequired;
  String? company;
  bool? streetAddressEnabled;
  bool? streetAddressRequired;
  String? streetAddress;
  bool? streetAddress2Enabled;
  bool? streetAddress2Required;
  String? streetAddress2;
  bool? zipPostalCodeEnabled;
  bool? zipPostalCodeRequired;
  String? zipPostalCode;
  bool? cityEnabled;
  bool? cityRequired;
  String? city;
  bool? countyEnabled;
  bool? countyRequired;
  String? county;
  bool? countryEnabled;
  bool? countryRequired;
  int? countryId;
  List<AvailableCountries>? availableCountries;
  bool? stateProvinceEnabled;
  bool? stateProvinceRequired;
  int? stateProvinceId;
  bool? phoneEnabled;
  bool? phoneRequired;
  String? phone;
  bool? faxEnabled;
  bool? faxRequired;
  String? fax;
  bool? newsletterEnabled;
  bool? newsletter;
  bool? signatureEnabled;
  String? signature;
  String? timeZoneId;
  bool? allowCustomersToSetTimeZone;

  String? vatNumber;
  String? vatNumberStatusNote;
  bool? displayVatNumber;
  int? numberOfExternalAuthenticationProviders;
  bool? allowCustomersToRemoveAssociations;

  ViewProfileResponse(
      {email,
      emailToRevalidate,
      checkUsernameAvailabilityEnabled,
      allowUsersToChangeUsernames,
      usernamesEnabled,
      username,
      genderEnabled,
      gender,
      firstNameEnabled,
      firstName,
      firstNameRequired,
      lastNameEnabled,
      lastName,
      lastNameRequired,
      dateOfBirthEnabled,
      dateOfBirthDay,
      dateOfBirthMonth,
      dateOfBirthYear,
      dateOfBirthRequired,
      companyEnabled,
      companyRequired,
      company,
      streetAddressEnabled,
      streetAddressRequired,
      streetAddress,
      streetAddress2Enabled,
      streetAddress2Required,
      streetAddress2,
      zipPostalCodeEnabled,
      zipPostalCodeRequired,
      zipPostalCode,
      cityEnabled,
      cityRequired,
      city,
      countyEnabled,
      countyRequired,
      county,
      countryEnabled,
      countryRequired,
      countryId,
      availableCountries,
      stateProvinceEnabled,
      stateProvinceRequired,
      stateProvinceId,
      phoneEnabled,
      phoneRequired,
      phone,
      faxEnabled,
      faxRequired,
      fax,
      newsletterEnabled,
      newsletter,
      signatureEnabled,
      signature,
      timeZoneId,
      allowCustomersToSetTimeZone,
      /*availableTimeZones,*/ vatNumber,
      vatNumberStatusNote,
      displayVatNumber,
      associatedExternalAuthRecords,
      numberOfExternalAuthenticationProviders,
      allowCustomersToRemoveAssociations,
      customerAttributes,
      gdprConsents,
      customProperties});

  ViewProfileResponse.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    emailToRevalidate = json['email_to_revalidate'];
    checkUsernameAvailabilityEnabled =
        json['check_username_availability_enabled'];
    allowUsersToChangeUsernames = json['allow_users_to_change_usernames'];
    usernamesEnabled = json['usernames_enabled'];
    username = json['username'];
    genderEnabled = json['gender_enabled'];
    gender = json['gender'];
    firstNameEnabled = json['first_name_enabled'];
    firstName = json['first_name'];
    firstNameRequired = json['first_name_required'];
    lastNameEnabled = json['last_name_enabled'];
    lastName = json['last_name'];
    lastNameRequired = json['last_name_required'];
    dateOfBirthEnabled = json['date_of_birth_enabled'];
    dateOfBirthDay = json['date_of_birth_day'];
    dateOfBirthMonth = json['date_of_birth_month'];
    dateOfBirthYear = json['date_of_birth_year'];
    dateOfBirthRequired = json['date_of_birth_required'];
    companyEnabled = json['company_enabled'];
    companyRequired = json['company_required'];
    company = json['company'];
    streetAddressEnabled = json['street_address_enabled'];
    streetAddressRequired = json['street_address_required'];
    streetAddress = json['street_address'];
    streetAddress2Enabled = json['street_address2_enabled'];
    streetAddress2Required = json['street_address2_required'];
    streetAddress2 = json['street_address2'];
    zipPostalCodeEnabled = json['zip_postal_code_enabled'];
    zipPostalCodeRequired = json['zip_postal_code_required'];
    zipPostalCode = json['zip_postal_code'];
    cityEnabled = json['city_enabled'];
    cityRequired = json['city_required'];
    city = json['city'];
    countyEnabled = json['county_enabled'];
    countyRequired = json['county_required'];
    county = json['county'];
    countryEnabled = json['country_enabled'];
    countryRequired = json['country_required'];
    countryId = json['country_id'];
    if (json['available_countries'] != null) {
      availableCountries = <AvailableCountries>[];
      json['available_countries'].forEach((v) {
        availableCountries!.add(AvailableCountries.fromJson(v));
      });
    }
    stateProvinceEnabled = json['state_province_enabled'];
    stateProvinceRequired = json['state_province_required'];
    stateProvinceId = json['state_province_id'];

    phoneEnabled = json['phone_enabled'];
    phoneRequired = json['phone_required'];
    phone = json['phone'];
    faxEnabled = json['fax_enabled'];
    faxRequired = json['fax_required'];
    fax = json['fax'];
    newsletterEnabled = json['newsletter_enabled'];
    newsletter = json['newsletter'];
    signatureEnabled = json['signature_enabled'];
    signature = json['signature'];
    timeZoneId = json['time_zone_id'];
    allowCustomersToSetTimeZone = json['allow_customers_to_set_time_zone'];
    /*if (json['available_time_zones'] != null) {
      availableTimeZones = <AvailableTimeZones>[];
      json['available_time_zones'].forEach((v) {
        availableTimeZones!.add(new AvailableTimeZones.fromJson(v));
      });
    }*/
    vatNumber = json['vat_number'];
    vatNumberStatusNote = json['vat_number_status_note'];
    displayVatNumber = json['display_vat_number'];
    numberOfExternalAuthenticationProviders =
        json['number_of_external_authentication_providers'];
    allowCustomersToRemoveAssociations =
        json['allow_customers_to_remove_associations'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['email_to_revalidate'] = emailToRevalidate;
    data['check_username_availability_enabled'] =
        checkUsernameAvailabilityEnabled;
    data['allow_users_to_change_usernames'] = allowUsersToChangeUsernames;
    data['usernames_enabled'] = usernamesEnabled;
    data['username'] = username;
    data['gender_enabled'] = genderEnabled;
    data['gender'] = gender;
    data['first_name_enabled'] = firstNameEnabled;
    data['first_name'] = firstName;
    data['first_name_required'] = firstNameRequired;
    data['last_name_enabled'] = lastNameEnabled;
    data['last_name'] = lastName;
    data['last_name_required'] = lastNameRequired;
    data['date_of_birth_enabled'] = dateOfBirthEnabled;
    data['date_of_birth_day'] = dateOfBirthDay;
    data['date_of_birth_month'] = dateOfBirthMonth;
    data['date_of_birth_year'] = dateOfBirthYear;
    data['date_of_birth_required'] = dateOfBirthRequired;
    data['company_enabled'] = companyEnabled;
    data['company_required'] = companyRequired;
    data['company'] = company;
    data['street_address_enabled'] = streetAddressEnabled;
    data['street_address_required'] = streetAddressRequired;
    data['street_address'] = streetAddress;
    data['street_address2_enabled'] = streetAddress2Enabled;
    data['street_address2_required'] = streetAddress2Required;
    data['street_address2'] = streetAddress2;
    data['zip_postal_code_enabled'] = zipPostalCodeEnabled;
    data['zip_postal_code_required'] = zipPostalCodeRequired;
    data['zip_postal_code'] = zipPostalCode;
    data['city_enabled'] = cityEnabled;
    data['city_required'] = cityRequired;
    data['city'] = city;
    data['county_enabled'] = countyEnabled;
    data['county_required'] = countyRequired;
    data['county'] = county;
    data['country_enabled'] = countryEnabled;
    data['country_required'] = countryRequired;
    data['country_id'] = countryId;
    if (availableCountries != null) {
      data['available_countries'] =
          availableCountries!.map((v) => v.toJson()).toList();
    }
    data['state_province_enabled'] = stateProvinceEnabled;
    data['state_province_required'] = stateProvinceRequired;
    data['state_province_id'] = stateProvinceId;

    data['phone_enabled'] = phoneEnabled;
    data['phone_required'] = phoneRequired;
    data['phone'] = phone;
    data['fax_enabled'] = faxEnabled;
    data['fax_required'] = faxRequired;
    data['fax'] = fax;
    data['newsletter_enabled'] = newsletterEnabled;
    data['newsletter'] = newsletter;
    data['signature_enabled'] = signatureEnabled;
    data['signature'] = signature;
    data['time_zone_id'] = timeZoneId;
    data['allow_customers_to_set_time_zone'] = allowCustomersToSetTimeZone;
    data['vat_number'] = vatNumber;
    data['vat_number_status_note'] = vatNumberStatusNote;
    data['display_vat_number'] = displayVatNumber;
    data['number_of_external_authentication_providers'] =
        numberOfExternalAuthenticationProviders;
    data['allow_customers_to_remove_associations'] =
        allowCustomersToRemoveAssociations;
    return data;
  }
}

class AvailableCountries {
  bool? disabled;
  String? group;
  bool? selected;
  String? text;
  String? value;

  AvailableCountries({disabled, group, selected, text, value});

  AvailableCountries.fromJson(Map<String, dynamic> json) {
    disabled = json['disabled'];
    group = json['group'];
    selected = json['selected'];
    text = json['text'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['disabled'] = disabled;
    data['group'] = group;
    data['selected'] = selected;
    data['text'] = text;
    data['value'] = value;
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
