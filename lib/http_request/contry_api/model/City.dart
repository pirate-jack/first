class City {
  String? cityName;
  City({
      this.cityName,});

  City.fromJson(dynamic json) {
    cityName = json['city_name'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['city_name'] = cityName;
    return map;
  }

}