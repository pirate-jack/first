import 'package:first/Local_Database/SQ_lite/data_base/db_helper.dart';
import 'package:first/Local_Database/SQ_lite/model/user_model.dart';
import 'package:first/Local_Database/SQ_lite/screen/user_create_list.dart';
import 'package:flutter/material.dart';

class ShowList extends StatefulWidget {
  const ShowList({super.key});

  @override
  State<ShowList> createState() => _ShowListState();
}

class _ShowListState extends State<ShowList> {
  @override
  List<User> userList = [];
  Dbhelper _dbhelper = Dbhelper();

  @override

  Future<void> _fetchUserList() async {
    var tempList = await _dbhelper.getAllData();
    setState(() {
      userList = tempList;
    });
  }

  void initState() {
    super.initState();
    _fetchUserList();
  }

  void _delete(User user, BuildContext context) {
    _dbhelper.removeData(user.id!).then((value) {
      if (value > 0) {
        setState(() {
          userList.removeWhere((element) => element.id == user.id);
          print('value: $value');
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.builder(
        itemCount: userList.length,
        itemBuilder: (context,  index) {
          User user = userList[index];
          return Card(
            elevation: 5,
            child: ListTile(
              onTap: () async {
                User? mUser = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserCreateList(user: user),
                      ),
                    ) ??
                    null;
                if (mUser != null) {
                  var index =
                      userList.indexWhere((element) => element.id == mUser.id);
                  setState(() {
                    userList[index] = mUser;
                  });
                }
              },
              leading: Icon(
                Icons.account_circle_outlined,
                size: 35,
                color: Colors.purple,
              ),
              title: Text(
                '${userList[index].Fname}  ${userList[index].Lname}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle:
                  Text('${userList[index].Email}\n${userList[index].Course}'),
              trailing: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text('Are you sure '),
                          content: Text('Delete'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                 _delete(user, context);
                                 Navigator.pop(context);
                              },
                              child: Text('Yes'),
                            ),
                            TextButton(onPressed: () {
                              Navigator.pop(context);
                            }, child: Text('No'),
                            )
                          ],
                        );
                      },
                    );
                  },
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            User? user = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserCreateList(),
                  ),
                ) ??
                null;
            if (user != null) {
              setState(() {
                userList.insert(0, user);
              });
            }
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.purple),
    );
  }
}
