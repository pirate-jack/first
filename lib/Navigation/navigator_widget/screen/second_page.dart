import 'package:first/Navigation/navigator_widget/screen/second_page.dart';
import 'package:first/Navigation/navigator_widget/screen/third_page.dart';
import 'package:flutter/material.dart';

class second_page extends StatelessWidget {
  final _address = TextEditingController();
  String name;
  int age;
  double salary;


  second_page({required this.name, required this.age, required this.salary});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second page'),
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
              '''),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _address,
                  decoration: InputDecoration(hintText: 'Enter a Address'),
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    String address = _address.text.trim();
                    print(address);
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          third_page(
                            address: address,
                            name: name,
                            salary: salary,
                            age: age,),));
                  },
                  child: Text('Submit'),
                ),
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
