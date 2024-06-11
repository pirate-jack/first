import 'package:first/Navigation/navigator_widget/screen/second_page.dart';
import 'package:flutter/material.dart';

class third_page extends StatelessWidget {
  String name,address;
  int age;
  double salary;


  third_page({required this.name, required this.address, required this.age, required this.salary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Third page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('''
              Name : $name 
              Age : $age 
              Salary : $salary
              Address : $address
              '''),

                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('GO BACK'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
