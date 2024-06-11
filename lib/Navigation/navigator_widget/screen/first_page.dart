import 'package:first/Navigation/navigator_widget/screen/second_page.dart';
import 'package:flutter/material.dart';

class firstpage extends StatelessWidget {
  final _name = TextEditingController();
  final _age = TextEditingController();
  final _salery = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('First page'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _name,
                  decoration: InputDecoration(hintText: 'Enter a name'),
                ),
                TextField(
                  controller: _age,
                  decoration: InputDecoration(hintText: 'Age'),
                ),
                TextField(
                  controller: _salery,
                  decoration: InputDecoration(hintText: 'Salary'),
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    String name = _name.text.trim();
                    int age = _age.text.trim().isEmpty ? 0 : int.parse(_age.text.trim(),);
                    double salary = _salery.text.trim().isEmpty ? 0 : double.parse(_salery.text.trim(),);
                   print('''
                    Name : $name;
                    Age : $age;
                    Salary : $salary
                    ''');
                   Navigator.push(context, MaterialPageRoute(builder:(context) => second_page(age: age,name: name,salary: salary,

                   ),),);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
