  

import 'package:flutter/material.dart';

class Learning extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _LearningState();
      }
      
    }
  
    
class _LearningState extends State<Learning> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home')
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