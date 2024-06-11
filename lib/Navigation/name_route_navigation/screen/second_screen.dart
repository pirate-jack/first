import 'package:first/Navigation/name_route_navigation/model_class/model.dart';
import 'package:flutter/material.dart';

class secondScreen extends StatelessWidget {
  final _address1 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var employee = ModalRoute.of(context)!.settings.arguments as Employee;
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Screen'),
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
              Age :  ${employee.age},
              Salary : ${employee.salary}
              '''),
                SizedBox(
                  height: 16,
                ),
                TextField(
                  controller: _address1,
                  decoration: InputDecoration(hintText: 'Enter a Address'),
                ),
                SizedBox(
                  height: 15,
                ),
                OutlinedButton(
                  onPressed: () {
                    String address = _address1.text.trim();
                    print(address);
                    employee.address = address;
                    Navigator.pushNamed(context, '/third', arguments:employee);
                  },
                  child: Text('Next'),
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
