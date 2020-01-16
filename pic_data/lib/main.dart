

import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main () => runApp(UserInfo());

class UserInfo extends StatefulWidget {
  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  Map img;
  List imgList;
  Future getUser() async {
     http.Response response = await http.get("https://pixabay.com/api/?key=14001068-da63091f2a2cb98e1d7cc1d82&q=beautiful&image_type=photo&pretty=true");
     img = json.decode(response.body);
    setState(() {
      imgList = img['hits'];
    });
  }
  @override
  void initState(){
    super.initState();
    getUser();
  }
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("User Infomation"),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: imgList == null ? 0: imgList.length,
          itemBuilder: (BuildContext context, int index) {
            final imgs = imgList[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: <Widget>[
                    Image.network(imgs['largeImageURL']),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          CircleAvatar(
                            radius: 25.0,
                            backgroundImage: NetworkImage(imgs['userImageURL']),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("${imgs['tags']}"),
                          ),
                          IconButton(
                            icon: Icon(Icons.favorite,
                              color: Colors.yellow,
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.share,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      )
                    ),
                  ],
                )
              ),
            );
          },
        ),
        ),
    );
  }
}