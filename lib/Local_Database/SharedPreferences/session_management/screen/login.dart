import 'package:first/Local_Database/SharedPreferences/session_management/preference/pref_manage.dart';
import 'package:first/Local_Database/SharedPreferences/session_management/screen/homeScreen.dart';
import 'package:first/Local_Database/SharedPreferences/session_management/screen/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _EmailController = TextEditingController();
  final _PasswordController = TextEditingController();
  bool st = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('LogIn'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                    status(st, context);
                    String Email = _EmailController.text.trim();
                    String Password = _PasswordController.text.trim();

                    if (PrefManage.getEmail() == Email &&
                        PrefManage.getPassword() == Password) {
                      print(PrefManage.getName());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('LogIn'),
                        ),
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeData(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Error'),
                        ),
                      );
                    }
                  },
                  child: Text('Login'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('You Dont Have Account ? '),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Signup(),
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
        ));
  }

  void status(bool st, BuildContext context) {
    st = !st;
    PrefManage.setLoginStatus(st);
  }
}
