import 'package:first/ListView/ListView_CRUD/model/user.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User> userList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ListViwe CRUD'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context, index) {
          User user = userList[index];
          return ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.blueAccent,
              child: Text(
                '${user.name?.toUpperCase()[0]}',
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            title: Text(
              '${user.name}',
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('${user.email}\n${user.contact}\n${user.uuid}'),
            trailing: PopupMenuButton(
              onSelected: (Value) {
                switch (Value) {
                  case 0:
                    showbottomsheet(context: context, user: user);
                    break;
                  case 1:
                    removeList(user, context);
                    break;
                }
              },
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('Edit'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('Delete'),
                  value: 1,
                )
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showbottomsheet(context: context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  void showbottomsheet({required BuildContext context, User? user}) {
    final _nameController =
        TextEditingController(text: user != null ? user.name : '');
    final _emailController =
        TextEditingController(text: user != null ? user.email : '');
    final _contactController =
        TextEditingController(text: user != null ? user.contact : '');
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom == 0
                    ? 20
                    : MediaQuery.of(context).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter name',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter email',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: _contactController,
                  decoration: InputDecoration(
                    hintText: 'Enter contact',
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () {
                      String _name = _nameController.text.trim();
                      String _email = _emailController.text.trim();
                      String _contact = _contactController.text.trim();

                      var Muser = User(
                        name: _name,
                        contact: _contact,
                        email: _email,
                        uuid: user != null ? user.uuid : getUserId(),
                      );

                      print(
                          ' name : $_name\n email : $_email\n contact : $_contact');

                      if (user == null) {
                        addUser(Muser, context);
                      } else {
                        updateUser(Muser, context);
                      }
                    },
                    child: Text(user == null ? 'Create User' : 'Edit user'),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void addUser(User user, BuildContext context) {
    setState(() {
      userList.add(user);
      Navigator.pop(context);
    });
  }

  getUserId() {
    var uuid = Uuid();
    return uuid.v4();
  }

  void removeList(User user, BuildContext context) {
    showDialog(context: context, builder: (context) => AlertDialog(
      title: Text('Delete'),
      content: Text('Are you sure Delete this User'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text('Cancel'),
        ),
        TextButton(
            onPressed: () {
              setState(() {
                userList.removeWhere((element) => element.uuid == user.uuid);
                Navigator.pop(context);
              });
            },
            child: Text('Sure'))
      ],
    ),);
  }

  void updateUser(User user, BuildContext context) {
    var index = userList.indexWhere((element) => element.uuid == user.uuid);
    if (index != -1) {
      setState(() {
        userList[index] = user;
        Navigator.pop(context);
      });
    }
  }
}
