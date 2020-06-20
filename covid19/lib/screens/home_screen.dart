import 'package:flutter/material.dart';
import './gmap.dart';
import './health.dart';
import './news_screen.dart';
import './learningscreen.dart';
import 'fitness.dart';
import 'world_gmap.dart';



class Home extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Covid19',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primaryColor: Colors.red,
      ),
      routes: <String,WidgetBuilder>{
         '/Home': (BuildContext context) => new WorldStatsWidget(), //new GoogleMapWidget(),
         '/News': (BuildContext context) => new NewsScreen(),
         '/Fitness': (BuildContext context) => new FitnessScreen(),
         '/Health': (BuildContext context) => new HealthScreen(),
         '/Learning': (BuildContext context) => new LearningScreen(),
      },
      home: new WorldStatsWidget(),// new GoogleMapWidget(), //home page displayed
      
    );
  }
}

