class Country {

  String? countryName;
  String? countryShortName;
  int? countryPhoneCode;

  Country({
      this.countryName, 
      this.countryShortName, 
      this.countryPhoneCode,});

  Country.fromJson(dynamic json) {
    countryName = json['country_name'];
    countryShortName = json['country_short_name'];
    countryPhoneCode = json['country_phone_code'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['country_name'] = countryName;
    map['country_short_name'] = countryShortName;
    map['country_phone_code'] = countryPhoneCode;
    return map;
  }

}