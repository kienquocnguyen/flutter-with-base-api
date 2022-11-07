

import 'dart:developer';

import 'package:flutterlearning/console_log.dart';
import 'package:flutterlearning/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  final console_log = logger;
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('https://jsonplaceholder.typicode.com/posts');
    var response = await client.get(uri);
    if(response.statusCode == 200){
      var json = response.body;
      console_log.d('Success');
      return postFromJson(json);
    }else{
      console_log.d('failed');
    }
  }
}