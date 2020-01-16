
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    debugShowCheckedModeBanner: false,
     home: Scaffold(
      appBar: AppBar(
        title: Text("Mobile App"),
      ),
      body: Center(
        child: RaisedButton(
          child: Text("Button App"),
          onPressed: () {},
          color: Colors.blue,
          ),
          ),
    ),
  ),
);