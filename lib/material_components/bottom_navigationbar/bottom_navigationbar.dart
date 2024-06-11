import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Bar',
      debugShowCheckedModeBanner: false,
      home: BottomNavigationbar(),
    );
  }
}

class BottomNavigationbar extends StatefulWidget {
  const BottomNavigationbar({super.key});

  @override
  State<BottomNavigationbar> createState() => _BottomNavigationbarState();
}

class _BottomNavigationbarState extends State<BottomNavigationbar> {
  int selectedIndex = 0;
  List<Widget> ListofWidget = [
    Container(
      child: Center(
        child: Text('Home'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Add Photo'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Store'),
      ),
    ),
    Container(
      child: Center(
        child: Text('Profile'),
      ),
    ),
  ];

  List<String> titelList = ['Home','Add Photo','Store','Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(titelList[selectedIndex]),
      ),
      body: ListofWidget[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        currentIndex: selectedIndex,
        //backgroundColor: Colors.blueAccent,
        // selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        // type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              label: 'Home',
              backgroundColor: Colors.blueAccent,
              icon: Icon(
                Icons.home_outlined,
              ),
              activeIcon: Icon(Icons.home)),
          BottomNavigationBarItem(
            backgroundColor: Colors.deepOrange,
            label: 'Add',
            icon: Icon(
              Icons.add_a_photo_outlined,
            ),
            activeIcon: Icon(Icons.add_a_photo_rounded),
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.deepPurple,
              label: 'Store',
              icon: Icon(
                Icons.add_business_outlined,
              ),
              activeIcon: Icon(Icons.add_business)),
          BottomNavigationBarItem(
              backgroundColor: Colors.green,
              label: 'Store',
              icon: Icon(
                Icons.person_outline_outlined,
              ),
              activeIcon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
