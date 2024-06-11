import 'package:first/Navigation/name_route_navigation/model_class/model.dart';
import 'package:flutter/material.dart';

class thirdScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var employee = ModalRoute.of(context)?.settings.arguments as Employee;
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
              Name : ${employee.name},
              Age : ${employee.age},
              Salary : ${employee.salary},
              Address : ${employee.address},
              '''),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                  ),
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
