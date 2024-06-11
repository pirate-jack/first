import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:first/http_request/xampp_http/model/Student.dart';
import 'package:first/http_request/xampp_http/model/registerResponce.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  String url = 'http://172.20.10.2/api/student.php';

  static ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  Future<void> addStudent(String name, String email, String mobile) async {
    var bodyMap = <String, dynamic>{
      'flag': '1',
      'name': name,
      'email': email,
      'mobile': mobile
    };

    var response = await post(Uri.parse('http://172.20.10.2/api/student.php'),
        body: bodyMap);
    if(response.statusCode == 201 || response.statusCode == 200){

      RegisterResponse res = RegisterResponse.fromJson(jsonDecode(response.body));
      if(res.status == 'success'){

      }else{
        throw Exception('failed to add student');
      }
    }
  }

  Future<List<Student>> getStudentList() async {
    List<Student> studentList = [];

    if (await checkConnection()) {
      try {
        http.Response response = await http
            .get(Uri.parse('http://172.20.10.2/api/student.php?flag=4'));

        if (response.statusCode == 200) {
          print('res: ${response.body}');
          var decodedData = jsonDecode(response.body);
          List<dynamic> studentData = decodedData['student'];

          studentList = studentData
              .map((studentMap) => Student.fromJson(studentMap))
              .toList();
        } else {
          throw Exception('Failed to load student');
        }
      } catch (e) {
        print(e.toString().trim());
        throw Exception('${e.toString().trim()}');
      }
    } else {
      throw Exception('No internet connection');
    }
    return studentList;
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
