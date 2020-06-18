

import 'package:flutter/material.dart';

class News extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewsState();
      }
      
    }
  
    
class _NewsState extends State<News> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('News')
      ),
      body: new Container(
         
        child: new Column(
          children: <Widget>[
            new Row(),
            new Row(),
          ],)
      ),
    );
  }
  
}