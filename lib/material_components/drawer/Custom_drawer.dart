import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: GmailScreen(),
    );
  }
}

class GmailScreen extends StatefulWidget {
  const GmailScreen({super.key});

  @override
  State<GmailScreen> createState() => _GmailScreenState();
}

class _GmailScreenState extends State<GmailScreen> {
  List<Widget> widgetList = [
   Container(
     height: 200,
     child: Column(
       children: [
         ListView.builder(itemCount: 10,itemBuilder: (context, index) {
           return ListTile(title: Text('Email From user ${index + 1}'),
           leading: CircleAvatar(
             child: Text('${index+1}'),

           ),
           );
         },)
       ],
     ),
   ),
    Center(
      child: Text('Primary'),
    ),
    Center(
      child: Text('Social'),
    ),
    Center(
      child: Text('Promotions'),
    )
  ];

  var selectIndex = 0;

  itemClicked(int index, BuildContext context) {
    setState(() {
      selectIndex = index;
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
                  Expanded(
                    child: widgetList[selectIndex],
                  )
                ],
              );
            },
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            SizedBox(
              height: 80,
              child: DrawerHeader(
                  child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Container(
                        height: 28, child: Image.asset('assets/gmail.png')),
                    radius: 25,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    'Gmail',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
                  ),
                ],
              )),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    selected: selectIndex == 0,
                    selectedTileColor: Colors.grey.shade400,
                    onTap: () {
                      itemClicked(0, context);
                    },
                    title: Text(
                      'All inboxes',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.all_inbox),
                  ),
                ),
                Divider(
                  indent: 58,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    selected: selectIndex == 1,
                    selectedTileColor: Colors.grey.shade400,
                    onTap: () {
                      itemClicked(1, context);
                    },
                    title: Text(
                      'Primary',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.inbox),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    selected: selectIndex == 2,
                    selectedTileColor: Colors.grey.shade400,
                    onTap: () {
                      itemClicked(2, context);
                    },
                    title: Text(
                      'Social',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.group_outlined),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      ),
                    ),
                    selected: selectIndex == 3,
                    selectedTileColor: Colors.grey.shade400,
                    onTap: () {
                      itemClicked(3, context);
                    },
                    title: Text(
                      'Promotions',
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                    leading: Icon(Icons.discount_outlined),
                  ),
                ),
                Divider(
                  indent: 58,
                ),
                ListTile(
                  title: Text(
                    'Snoozed',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.access_time_rounded),
                ),
                ListTile(
                  title: Text(
                    'Important',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.label_important_outline),
                ),
                ListTile(
                  title: Text(
                    'Send',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.send_outlined),
                ),
                ListTile(
                  title: Text(
                    'Scheduled',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.send_and_archive_outlined),
                ),
                ListTile(
                  title: Text(
                    'Outbox',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.outbox),
                ),
                ListTile(
                  title: Text(
                    'Drafts',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.insert_drive_file_outlined),
                ),
                ListTile(
                  title: Text(
                    'All emails',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.mark_as_unread_outlined),
                ),
                ListTile(
                  title: Text(
                    'Spam',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.report_gmailerrorred_outlined),
                ),
                ListTile(
                  title: Text(
                    'Bin',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.delete_outline_rounded),
                ),
                Divider(
                  indent: 58,
                ),
                ListTile(
                  title: Text(
                    'Create new',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.add),
                ),
                Divider(
                  indent: 58,
                ),
                ListTile(
                  title: Text(
                    'Settings',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.settings_outlined),
                ),
                ListTile(
                  title: Text(
                    'Send feedback',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.messenger_outline),
                ),
                ListTile(
                  title: Text(
                    'Help',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.w500),
                  ),
                  leading: Icon(Icons.help_outline),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
