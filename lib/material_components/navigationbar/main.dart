import 'package:first/material_components/navigationbar/model/model.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<ItemList> itemList = [];

  @override
  void initState() {
    super.initState();
    itemList.add(
      ItemList(
          titel: 'Home',
          label: 'Home',
          screen: Container(

          ),
          iconData: Icons.home_outlined),
    );
    itemList.add(
      ItemList(
          titel: 'Notification',
          label: 'Notification',
          screen: Container(
            color: Colors.blue,
          ),
          iconData: Icons.notifications_none),
    );
    itemList.add(
      ItemList(
          titel: 'Profile',
          label: 'Profile',
          screen: Container(
            color: Colors.yellow,
          ),
          iconData: Icons.person_outline_outlined),
    );
    itemList.add(ItemList(
        titel: 'Map',
        label: 'Map',
        screen: Container(
          color: Colors.blueAccent,
        ),
        iconData: Icons.map,));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemList[selectedIndex].titel),
      ),
      body: itemList[selectedIndex].screen,
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
            TextStyle(color: Colors.white)
          )
        ),
        child: NavigationBar(
          animationDuration: Duration(seconds: 1),
          indicatorColor: Colors.deepOrangeAccent.shade200,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          backgroundColor: Colors.deepOrangeAccent.shade400,

          destinations: List.generate(
              itemList.length,
                  (index) => NavigationDestination(
                icon: Icon(itemList[index].iconData,color: Colors.white),
                label: itemList[index].label,)),
          selectedIndex: selectedIndex,
          onDestinationSelected: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
        ),
      )
    );
  }
}
