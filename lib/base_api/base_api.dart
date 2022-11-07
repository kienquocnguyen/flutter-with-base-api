import 'package:http/http.dart' as http;

const String baseUrl = 'https://jsonplaceholder.typicode.com/';
class BaseAPI {
  var client = http.Client();
  Future<dynamic> get(String api, var header) async{
    var url = Uri.parse(baseUrl + api);
    
    final response = await client.get(url, headers: header);
    return response;
  }

  Future<dynamic> post(String api) async{}

  Future<dynamic> put(String api) async{}

  Future<dynamic> delete(String api) async{}
}