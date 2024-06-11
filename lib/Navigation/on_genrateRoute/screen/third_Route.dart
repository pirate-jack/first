
import 'package:flutter/material.dart';

import '../model_class/model.dart';

class ThirdRoute extends StatelessWidget {
  Employee1? employee;

  ThirdRoute({this.employee});

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
              Name : ${employee?.name},
              Age : ${employee?.age},
              Salary : ${employee?.salary},
              Address : ${employee?.address},
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
