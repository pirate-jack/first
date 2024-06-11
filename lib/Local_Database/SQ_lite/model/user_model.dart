import 'package:first/ListView/ListView_CRUD/model/user.dart';

class User {
  int? id;
  String Fname;
  String Lname;
  String Email;
  String Contect;
  String Course;
  int CreateAt;

  User({ this.id,
    required this.Fname,
    required this.Lname,
    required this.Email,
    required this.Contect,
    required this.Course,
    required this.CreateAt});

  //convert to map

  Map<String, dynamic> toMap() {
    return {
      'fname': Fname,
      'lname': Lname,
      'email': Email,
      'contact': Contect,
      'course': Course,
      'createAt': CreateAt
    };
  }

  factory User.fromMap(Map<String, dynamic>map){
    return User(
        id: map['id'],
        Fname: map['fname'],
        Lname: map['lname'],
        Email: map['email'],
        Contect: map['contact'],
        Course: map['course'],
        CreateAt: map['createAt']);
  }
}
