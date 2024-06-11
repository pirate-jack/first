import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dilog Boxs',
      home: DilogBox(),
    );
  }
}

class DilogBox extends StatelessWidget {
  List<String> languageList = [
    'Java',
    'Dart',
    'Kotlin',
    'Ruby',
    'Python',
    'C language',
    'C++',
    'PHP',
    'Java Script',
    'Pascal',
    'Cobol',
    'Objective C',
    'Swift'
  ];
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dilog Boxs'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                bool result = await ShowDilog(context);
                if (result) {
                  print('logout');
                } else {
                  print('cancel');
                }
              },
              child: Text('Show Dilog'),
            ),
            SizedBox(
              height: 16,
            ),
            ElevatedButton(
              onPressed: () async {
                String? result = await showSimpleDialog(context);
                print(result);
              },
              child: Text('Show Simple List Dialog'),
            ),
          ],
        ),
      ),
    );
  }

  Future ShowDilog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Alert'),
        content: Text('Are You Sure You Want Logout '),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context, false);
            },
            child: Text('Cancel'),
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text('Yes'))
        ],
      ),
    );
  }

  Future<String?> showSimpleDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        title: Text('Select Language'),
        children: List.generate(
          languageList.length,
              (index) => SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, languageList[index]);
            },
            child: Text(languageList[index]),
          ),
        ),
        /* children: [
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 'Java');
            },
            child: Text('Java'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 'Dart');
            },
            child: Text('Dart'),
          ),
          SimpleDialogOption(
            onPressed: () {
              Navigator.pop(context, 'Kotlin');
            },
            child: Text('Kotlin'),
          ),
        ],*/
      ),
    );
  }
}
