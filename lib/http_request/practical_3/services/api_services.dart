import 'dart:convert';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:first/http_request/practical_3/model/album.dart';
import 'package:http/http.dart' as http;


class ApiService {
  String url = "https://reqres.in/api/users?page=2";
  String url1 = "https://jsonplaceholder.typicode.com/albums";

  static ApiService _instance = ApiService._internal();

  // factory constructor
  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  Future<List<Albums>> getAlbumList() async {
    List<Albums> albumList = [];

    if (await checkConnection()) {
      try {
        http.Response response = await http.get(Uri.parse(url1));

        if (response.statusCode == 200) {
          List<dynamic> list = jsonDecode(response.body) as List<dynamic>;
          albumList = List.generate(
              list.length, (index) => Albums.fromJson(list[index])).toList();
        } else {
          throw Exception('Failed to load album');
        }
      } catch (e) {
        throw Exception('Failed to load album');
      }
    } else {
      throw Exception('No internet connection');
    }

    return albumList;
  }

  Future<Albums?> getAlbum(String id) async {
    if (await checkConnection()) {
      try {
        http.Response response = await http.get(Uri.parse('$url1/$id'));

        if (response.statusCode == 200) {
          return Albums.fromJson(jsonDecode(response.body));
        } else {
          throw Exception('Failed to load album');
        }
      } catch (e) {
        throw Exception('Failed to load album');
      }
    } else {
      throw Exception('No internet connection');
    }
  }

  Future<bool> checkConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
