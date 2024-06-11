import 'package:first/http_request/practical_3/model/album.dart';
import 'package:first/http_request/practical_3/services/api_services.dart';
import 'package:flutter/material.dart';

class AlbumShow extends StatefulWidget {
  Albums? albums;



  AlbumShow({this.albums});

  @override
  State<AlbumShow> createState() => _AlbumShowState();
}

class _AlbumShowState extends State<AlbumShow> {
  ApiService _service = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AlbumShow'),),
      body: FutureBuilder(
        future: _service.getAlbum(widget.albums!.id.toString()),
        builder: (context, snapshot) {
          if(snapshot.connectionState ==  ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else if(snapshot.hasError){
            return Center(
              child: Text('error :${snapshot.error}'),
            );
          }else{
            Albums? album = snapshot.data;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ID ${album!.id}'),
                  Text('titel : ${album.title}'),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
