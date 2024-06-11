import 'package:first/http_request/xampp_http/model/Student.dart';
import 'package:first/http_request/xampp_http/services/api_services.dart';
import 'package:first/http_request/xampp_http/view/studentAdd.dart';
import 'package:flutter/material.dart';


class ShowStudentList extends StatefulWidget {
  const ShowStudentList({super.key});

  @override
  State<ShowStudentList> createState() => _ShowStudentListState();
}

class _ShowStudentListState extends State<ShowStudentList> {
  ApiService _service = ApiService();
  @override
  void initState() {
        super.initState();
        setState(() {
          _service.getStudentList();

        });
  }
  @override



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Data'),
      ),
      body: FutureBuilder(
        future: _service.getStudentList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.blue,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            List<Student> studentList = snapshot.data ?? [];
            return ListView.builder(
              itemCount: studentList.length,
              itemBuilder: (context, index) {
                Student student = studentList[index];
                return Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text(student.id as String),
                        ),
                        title: Text('id : ${student.name}'),
                        subtitle: Text(
                            'name : ${student.email}\nemail : ${student.mobile}'),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddStudent(),));
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
