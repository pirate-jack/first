
import 'package:first/http_request/xampp_http/services/api_services.dart';
import 'package:flutter/material.dart';

class AddStudent extends StatefulWidget {
  const AddStudent({super.key});

  @override
  State<AddStudent> createState() => _AddStudentState();
}

class _AddStudentState extends State<AddStudent> {
  final _nameContoller = TextEditingController();
  final _emailContoller = TextEditingController();
  final _mobileContoller = TextEditingController();
  ApiService _service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Student'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _nameContoller,
                decoration: InputDecoration(
                  hintText: 'Enter Name',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _emailContoller,
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _mobileContoller,
                decoration: InputDecoration(
                  hintText: 'Enter Mobile',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  String name = _nameContoller.text.trim();
                  String email = _emailContoller.text.trim();
                  String mobile = _mobileContoller.text.trim();
                  _service.addStudent(name, email, mobile);
                  Navigator.pop(context);

                },
                child: Text('Add Student'),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.grey)),
              )
            ],
          ),
        ),
      ),
    );
  }


}
