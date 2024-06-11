
import 'package:first/Local_Database/SharedPreferences/sharedpreferences/screen/homeScreen.dart';
import 'package:first/Local_Database/SharedPreferences/sharedpreferences/screen/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signin extends StatefulWidget {
  const Signin({super.key});

  @override
  State<Signin> createState() => _SigninState();
}
final TextEditingController name = TextEditingController();
final TextEditingController email = TextEditingController();
final TextEditingController password = TextEditingController();
class _SigninState extends State<Signin> {
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
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Name',
                  hintText: 'Enter Name',
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  hintText: 'Enter Email',labelText: 'Email'
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Enter Password',labelText: 'Password'
                ),
              ),
              SizedBox(
                height: 15,
              ),
              OutlinedButton(onPressed: () {
                String Name = name.text.trim();
                String Email = email.text.trim();
                String Password = password.text.trim();
                print('''
                name: $Name
                email: $Email
                password:$Password
                ''');
                SetData(Name, Email, Password);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Login(),),);
              }, child: Text('Sign in'),
              ),
              SizedBox(height: 15,),
              OutlinedButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomeScreen(),));
              }, child: Text('Navigate'),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> SetData(String name, String email, String password) async {

    try{
      SharedPreferences Pref = await SharedPreferences.getInstance();
      await Pref.setString('NAME', name);
      await Pref.setString('EMAIL',email);
      await Pref.setString('PASSWORD',password);
      print('record save');
    }
    catch(e){
      print(e.toString());
    }
  }
}
