import 'package:first/Navigation/name_route_navigation/model_class/model.dart';
import 'package:flutter/material.dart';

class firstScreen extends StatelessWidget {
  final _name1 = TextEditingController();
  final _age1 = TextEditingController();
  final _salery1 = TextEditingController();

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
                  controller: _name1,
                  decoration: InputDecoration(hintText: 'Enter a name'),
                ),
                TextField(
                  controller: _age1,
                  decoration: InputDecoration(hintText: 'Age'),
                ),
                TextField(
                  controller: _salery1,
                  decoration: InputDecoration(hintText: 'Salary'),
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    String name = _name1.text.trim();
                    int age = _age1.text.trim().isEmpty ? 0 : int.parse(_age1.text.trim(),);
                    double salary = _salery1.text.trim().isEmpty ? 0 : double.parse(_salery1.text.trim(),);
                    print('''
                    Name : $name;
                    Age : $age;
                    Salary : $salary
                    ''');
                  Employee emp = Employee(name: name,age: age,salary: salary);
                  Navigator.pushNamed(context,'/second',arguments: emp);
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
