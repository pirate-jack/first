import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Drawer',
      home: DashboardScreen(),
      theme: ThemeData(listTileTheme: ListTileThemeData()),
    );
  }
}

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<String> categoryList = ['Bags', 'Electronics', 'Shoes', 'Cloths'];

  List<Widget> widgetList = [
    Center(
      child: Text('Home Screen'),
    ),
    Center(
      child: Text('Order Screen'),
    ),
    Center(
      child: Text('Notification Screen'),
    ),
    Center(
      child: Text('Wishlist Screen'),
    )
  ];

  int selectedIndex = 0;

  itemClicked(int index, BuildContext context) {
    setState(() {
      selectedIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return Column(
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Scaffold.of(context).openDrawer();
                      },
                      icon: Icon(
                        Icons.menu,
                        color: Colors.grey,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8),
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(color: Colors.grey),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.shade300,
                              blurRadius: 5,
                              spreadRadius: 3,
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'type here..',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: widgetList[selectedIndex],
                )
              ],
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  /*crossAxisAlignment: CrossAxisAlignment.start,*/
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Tops Technologies',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'topstechnologies@gmail.com',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: ListTile(
                onTap: () {
                  itemClicked(0, context);
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                ),
                selected: selectedIndex == 0,
                selectedTileColor: Colors.grey.shade300,
                leading: Icon(
                  Icons.home,
                  color: Colors.grey,
                ),
                title: Text('Home'),
              ),
            ),
            ListTile(
              onTap: () {
                itemClicked(1, context);
              },
              selected: selectedIndex == 1,
              selectedTileColor: Colors.grey.shade300,
              leading: Icon(
                Icons.shopping_bag,
                color: Colors.grey,
              ),
              title: Text('My Orders'),
            ),
            ListTile(
              onTap: () {
                itemClicked(2, context);
              },
              selected: selectedIndex == 2,
              selectedTileColor: Colors.grey.shade300,
              leading: Icon(
                Icons.notifications,
                color: Colors.grey,
              ),
              title: Text('Notification'),
              trailing: Badge(
                label: Text('50'),
              ),
            ),
            ListTile(
              onTap: () {
                itemClicked(3, context);
              },
              selected: selectedIndex == 3,
              selectedTileColor: Colors.grey.shade300,
              leading: Icon(
                Icons.bookmark,
                color: Colors.grey,
              ),
              title: Text('Wishlist'),
            ),
            Divider(
              color: Colors.black,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.category,
                color: Colors.grey,
              ),
              title: Text('All Categories'),
              children: List.generate(
                categoryList.length,
                    (index) => ListTile(
                  title: Text(categoryList[index]),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
