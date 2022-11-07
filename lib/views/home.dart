import 'package:flutter/material.dart';
import 'package:flutterlearning/models/post.dart';
import 'package:flutterlearning/base_api/index.dart';

class Myhome extends StatefulWidget {
  Myhome({Key ? key}) : super(key: key);

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  var isLoaded = false;
  var data;

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Container(
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () async {
                var response = await ServerAPI.getPost();
                if(response.statusCode == 200){
                  setState(() {
                    data = postFromJson(response.body);
                    isLoaded = true;
                  });
                  debugPrint('Succesfull');
                }else{
                  debugPrint('Failed');
                  return;
                }
              }, 
              child: Text("Click to get the API")
            ),
            Expanded(
              child: Visibility(
                visible: isLoaded,
                child: ListView.builder(
                  itemCount: data?.length,
                  itemBuilder: (context, index){
                    return Container(
                      child: Text(
                        data![index].title,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          height: 2
                        ),
                      ),
                    );
                  },
                ),
                replacement: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}