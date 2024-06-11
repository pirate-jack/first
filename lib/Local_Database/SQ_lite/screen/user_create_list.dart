import 'package:first/Local_Database/SQ_lite/data_base/db_helper.dart';
import 'package:first/Local_Database/SQ_lite/model/user_model.dart';

import 'package:flutter/material.dart';

class UserCreateList extends StatefulWidget {
  User? user;

  UserCreateList({this.user});

  @override
  State<UserCreateList> createState() => _UserCreateListState();
}

class _UserCreateListState extends State<UserCreateList> {
  List<String> Course = ['Java', 'Python', 'Dart', 'HTML', 'Kotlin'];
  String? selectedCourse;

  final _fnameController = TextEditingController();
  final _lnameController = TextEditingController();
  final _emailController = TextEditingController();
  final _contactController = TextEditingController();
  Dbhelper dbhelper = Dbhelper();

  Future<void> updateUser(User user, BuildContext context) async {
    int result = await dbhelper.updateRecord(user);

    if (result > 0) {
      print('Record updated successfully..');
      Navigator.pop(context, user);
    } else {
      print('Getting error..');
      Navigator.pop(context, null);
    }
  }

  Future<void> addUser(User user, BuildContext context) async {
    print(user.toMap());
    int result = await dbhelper.insertRecord(user);
    if (result != -1) {
      user.id = result;
      Navigator.pop(context, user);
      print('user add');
    } else {
      print('error');
      Navigator.pop(context, null);
    }
  }

  @override
  void initState() {
    if (widget.user != null) {
      _fnameController.text = widget.user!.Fname;
      _lnameController.text = widget.user!.Lname;
      _emailController.text = widget.user!.Email;
      _contactController.text = widget.user!.Contect;
      selectedCourse = widget.user!.Course;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _fnameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'First Name',
                          labelText: 'First Name'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _lnameController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15)),
                          hintText: 'Last Name',
                          labelText: 'Last Name'),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Email',
                    labelText: 'Email'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _contactController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Contact',
                    labelText: 'Contact'),
              ),
              SizedBox(
                height: 15,
              ),
              DropdownButton(
                isExpanded: true,
                hint: Text('Select Course'),
                value: selectedCourse,
                items: List.generate(
                  Course.length,
                  (index) => DropdownMenuItem(
                    child: Text(Course[index]),
                    value: Course[index],
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    selectedCourse = value;
                  });
                },
              ),
              SizedBox(
                height: 15,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: FilledButton(
                  onPressed: () {
                    String fname = _fnameController.text.trim();
                    String lname = _lnameController.text.trim();
                    String email = _emailController.text.trim();
                    String contact = _contactController.text.trim();

                    print('''
                  fname : $fname
                  lname : $lname
                  email : $email
                  contact : $contact
                  course : $selectedCourse
                  ''');
                    User user = User(
                        id: widget.user != null ? widget.user!.id : null,
                        Fname: fname,
                        Lname: lname,
                        Email: email,
                        Contect: contact,
                        Course: selectedCourse!,
                        CreateAt: widget.user != null
                            ? widget.user!.CreateAt
                            : DateTime.now().millisecondsSinceEpoch);
                    if (widget.user != null) {
                      updateUser(user, context);
                    } else {
                      addUser(user, context);
                    }
                  },
                  child: Text(widget.user != null ? 'Update' : 'Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
