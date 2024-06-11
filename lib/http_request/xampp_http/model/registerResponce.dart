

import 'package:first/http_request/xampp_http/model/Student.dart';

class RegisterResponse {
  String? status;
  String? message;
  Student? user;

  RegisterResponse({
    this.status,
    this.message,
    this.user,
  });

  RegisterResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    user = json['user'] != null ? Student.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}
