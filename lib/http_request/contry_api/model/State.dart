class State {
  String? stateName;
  State({
      this.stateName,});

  State.fromJson(dynamic json) {
    stateName = json['state_name'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['state_name'] = stateName;
    return map;
  }

}