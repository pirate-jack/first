import 'dart:convert';

import 'package:first/http_request/contry_api/model/City.dart';
import 'package:first/http_request/contry_api/model/Contry.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Api(),
    );
  }
}

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  String? _selectedContry = null;
  String? _selectedState = null;
  String _selectedCity = '';
  List<State> stateList = [];
  List<Country> countryList = [];
  List<City> cityList = [];

  String Url = 'https://www.universal-tutorial.com/api';

  void initState() {
    super.initState();
    loadContry();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contry Selection'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DropdownButtonFormField(
                  value: _selectedContry,
                  items: List.generate(
                    countryList.length,
                        (index) => DropdownMenuItem(
                      value: countryList[index].countryName,
                      child: Text('${countryList[index].countryName}'),
                    ),
                  ).toList(),
                  decoration: InputDecoration(labelText: 'Select Country'),
                  onChanged: (value) {
                    setState(() {
                      _selectedContry = value;
                      stateList.clear();

                    });
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  hint: Text('Select State'),
                  value: _selectedContry,
                  items: null,
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 15,
                ),
                DropdownButtonFormField(
                  hint: Text('Select Cityxx'),
                  value: _selectedContry,
                  items: null,
                  onChanged: (value) {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> loadContry() async {
    try {
      var haderMap = {
        "Accept": "application/json",
        "Authorization":
            'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJfZW1haWwiOiJrcmlzcGF0ZWwyM0BnbWFpbC5jb20iLCJhcGlfdG9rZW4iOiI2T3IwaU1HUVhQRFUyaktYcmFOaWJWZ1N6cUJ5blFLOUhVTXZhUG1RaDNRaWJNZENPemlLYXNSRnBXWE1sb0M0bDdnIn0sImV4cCI6MTcxNTQ5MjY3Nn0.rXFJ9pfBOtu90ZqA-zRjrQ8PLXUNN9RyQldTFgJ6Yhg'
      };
      Response response =
          await get(Uri.parse('$Url/countries'), headers: haderMap);

      if (response.statusCode == 200) {
        List<dynamic> countries = jsonDecode(response.body) as List<dynamic>;
        setState(() {
          countryList = List.generate(countries.length,
              (index) => Country.fromJson(countries[index])).toList();
          print(countryList);
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
