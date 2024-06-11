import 'package:first/http_request/practical_3/albumshow.dart';
import 'package:first/http_request/practical_3/model/album.dart';
import 'package:first/http_request/practical_3/services/api_services.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Album(),
    );
  }
}

class Album extends StatefulWidget {
  @override
  State<Album> createState() => _AlbumState();
}

class _AlbumState extends State<Album> {
  ApiService _service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AlbumsList Shows'),
      ),
      body: FutureBuilder(
          future: _service.getAlbumList(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('${snapshot.error.toString()}'),
              );
            } else {
              List<Albums> albumList = snapshot.data ?? [];
              return ListView.builder(
                itemCount: albumList.length,
                itemBuilder: (context, index) {
                  Albums albums = albumList[index];
                  return Card(
                    borderOnForeground: true,
                    color: Colors.blue,
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AlbumShow(
                                      albums: albums,
                                    )));
                      },
                      title: Text('${albumList[index].id}',style: TextStyle(color: Colors.white),),
                      subtitle: Text('${albumList[index].title}',style: TextStyle(color: Colors.white),),
                    ),
                  );
                },
              );
            }
          }),
    );
  }
}
