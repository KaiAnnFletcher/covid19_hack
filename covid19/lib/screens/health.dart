

import 'package:flutter/material.dart';

import '../api/recipeAPIService.dart';

APIService apiService = APIService();
// You future
Future future;
//in the initState() or use it how you want...

class Health extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _HealthState();
      }
      
    }
  
    
class _HealthState extends State<Health> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    future = apiService.get(endpoint:'https://edamam-food-and-grocery-database.p.rapidapi.com/parser', query:{"ingr": "aaple"});
    
  }
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