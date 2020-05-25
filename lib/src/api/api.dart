import 'package:flutterapp/src/models/photos.dart';
import 'package:flutterapp/src/models/posts.dart';
import 'package:http/http.dart' show Client;

class API{
//  static const baseUrl = 'https://jsonplaceholder.typicode.com/posts';
//
//  final Client _client = Client();
//
//  Future<List<Photos>> getPhotos() async {
//    List<Photos> photosList;
//
//    final response = await _client.get(baseUrl);
//    photosList = photosFromJson(response.body);
//
//    return photosList;
//  }

  static const baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  final Client _posts = Client();

  Future<List<Posts>> getPosts() async {
    List<Posts> postsList;

    final response = await _posts.get(baseUrl);
    postsList = postsFromJson(response.body);

    return postsList;
  }

}