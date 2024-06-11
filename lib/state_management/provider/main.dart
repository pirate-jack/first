import 'package:first/state_management/provider/model/counters.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Provider(child: HomeScreen(),create:(context) => Counters(), ),
    );
  }
}

class HomeScreen extends StatelessWidget {

  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text(
                  '+',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                onPressed: () {
                  Provider.of<Counters>(context,listen: false).incremnet();
                },
              ),
              Text("$count",style: TextStyle(fontSize: 30),),
              ElevatedButton(
                child: Text(
                  '-',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                onPressed: () {
                  Provider.of<Counters>(context,listen: false).decrement();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

}
