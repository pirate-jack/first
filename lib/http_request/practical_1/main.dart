import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Https GET request',
      home: UserListScreen(),
    );
  }
}

class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String url = 'https://reqres.in/api/users?page=2';

  Future<void> fetchUserList() async {}

  @override
  void initState() {
    super.initState();
    fetchUserList();
  }

  @override
  // First add line in app level main file to add line androidManifest "<uses-permission android:name="andorid.permission.INTERNET"/>"
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Https GET request'),
      ),
      body: Center(
        child: Container(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
