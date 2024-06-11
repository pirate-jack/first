import 'package:first/Local_Database/SharedPreferences/sharedpreferences/screen/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../session_management/preference/pref_manage.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}
TextEditingController l_email= TextEditingController();
TextEditingController l_password= TextEditingController();

String _email = '';
String _email1 = '';
String _password1 = '';
String _password = '';

class _LoginState extends State<Login> {
  Future<void> LoadData() async {
    SharedPreferences Pref =await SharedPreferences.getInstance();
    setState(() {
      _email1 = Pref.getString('EMAIL')??'';
      _password1 = Pref.getString('PASSWORD')??'';
    });
  }
  @override
  void initState() {
    LoadData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: l_email,
                decoration:
                    InputDecoration(hintText: 'Enter Email', labelText: 'Email'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: l_password,
                decoration: InputDecoration(
                    hintText: 'Enter Password', labelText: 'Password'),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(
                onPressed: () {

                  _email = l_email.text.trim();
                  _password = l_password.text.trim();
                  print('''Name: $_email
                           password: $_password
                           data: $_email1  
                           data: $_password1
                           ''');

                  if(_email==_email1 && _password==_password1){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomeScreen(),),);
                  }else{print('Not Compare');}
                },
                child: Text('log in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
