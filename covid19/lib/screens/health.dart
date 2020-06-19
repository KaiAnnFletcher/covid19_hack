

import 'package:flutter/material.dart';

class Health extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HealthState();
      }
      
    }
  
    
class _HealthState extends State<Health> {
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