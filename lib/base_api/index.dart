import 'package:flutterlearning/base_api/base_api.dart';

class ServerAPI{
  static getPost(){
    const url = 'posts';
    const header = {
      "Content-Type": "application/json"
    };
    return BaseAPI().get(url, header).catchError((err) {});
  }
}