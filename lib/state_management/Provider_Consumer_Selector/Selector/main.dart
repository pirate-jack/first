
import 'package:first/state_management/Provider_Consumer_Selector/Consumer/model/model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Consumer Widget',
      home: ChangeNotifierProvider(
        create: (context) => Person(name: 'Kris', age: 18),
        child: HomeScreen(),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    print('build method called..');

    return Scaffold(
      appBar: AppBar(
        title: Text('Extension Method'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<Person>(
              builder: (context, person, child) {
                print('consumer : name rebuild');

                return Text(
                  'Name : ${person.name}',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),


            SizedBox(
              height: 12,
            ),
            Consumer<Person>(
              builder: (context, person, child) {
                print('consumer : age rebuild');

                return Text(
                  'Age : ${person.age}',
                  style: TextStyle(fontSize: 20),
                );
              },
            ),


            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Person>(context, listen: false).updateName();
              },
              child: Text('Change Name'),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<Person>(context, listen: false).grow();
              },
              child: Text('Grow'),
            )
          ],
        ),
      ),
    );
  }
}
