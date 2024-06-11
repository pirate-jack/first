import 'package:flutter/material.dart';
import '../model_class/model.dart';
import '../route/app_route.dart';

class SecondRoute extends StatelessWidget {
  final _address1 = TextEditingController();

  Employee1? employee ;

  SecondRoute({this.employee});

  @override
  Widget build(BuildContext context) {
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
              Name : ${employee?.name}, 
              Age :  ${employee?.age},
              Salary : ${employee?.salary}
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
                    employee!.address = address;
                  Navigator.pushNamed(context, App_Routegenrate.thirdroute, arguments: employee);
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
