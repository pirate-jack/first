import 'package:first/Local_Database/SharedPreferences/session_management/preference/pref_manage.dart';
import 'package:first/Local_Database/SharedPreferences/session_management/screen/homeScreen.dart';
import 'package:first/Local_Database/SharedPreferences/session_management/screen/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _NameController = TextEditingController();
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();

  void signup(
      String name, String email, String password, BuildContext context) {
    PrefManage.createAccount(name, email, password).then(
      (result) {
        if (result) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('AccountCreated'),
            ),
          );
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeData(),));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Error'),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _NameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Name',
                    labelText: 'Name'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _EmailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Email',
                    labelText: 'Email'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _PasswordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Password',
                    labelText: 'Password'),
              ),
              SizedBox(
                height: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  String Name = _NameController.text.trim();
                  String Email = _EmailController.text.trim();
                  String Password = _PasswordController.text.trim();
                  signup(Name, Email, Password, context,);
                },
                child: Text('SignUp'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('You Already Have Account ? '),
                  GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Login(),
                            ));
                      },
                      child: Text(
                        'Click me!',
                        style: TextStyle(color: Colors.blue),
                      )),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
