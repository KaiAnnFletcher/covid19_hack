import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hack_covid19/models/elearningData.dart';
import 'package:logger/logger.dart';

class LearningApiProvider {

static List<ElearningData> list = new List<ElearningData>();
var logger = Logger();
  Future<String> _loadELearningAsset() async {
  logger.i("loading data new place");
  return await rootBundle.loadString('backup_json_api/elearning.json');
}

Future<List<ElearningData>> loadELearningData() async {
  
  await wait(5);
  String jsonString = await _loadELearningAsset(); 

list=(json.decode(jsonString) as List).map((i) =>
              ElearningData.fromJson(i)).toList();
  logger.i("list is " + list.length.toString());
  return list;
}

Future wait(int seconds) {
  return new Future.delayed(Duration(seconds: seconds), () => {});
}
Future<List<ElearningData>> loadELearningProgrammingData() async {
  var logger = Logger();
  
 loadELearningData();
  List<ElearningData> programmingList = new List<ElearningData>();
  logger.i("list length within prograaming method" +list.length.toString());
  for(ElearningData data in list){
    logger.i("category"+data.category);
    if (data.category == "Programming"){
      programmingList.add(data);
    }
  }
  logger.i("returning programming list" + programmingList.length.toString());
  return programmingList;
}
Future<List<ElearningData>> loadELearningDIYData() async {
  var logger = Logger();
  
  await wait(5);
 loadELearningData();
  List<ElearningData> diyList = new List<ElearningData>();
  for(ElearningData data in list){
    if (data.category == "DIY"){
      diyList.add(data);
    }
  }
  logger.i("returning diy list" + diyList.length.toString());
  return diyList;
}
Future<List<ElearningData>> loadELearningMusicData() async {
  var logger = Logger();
  await wait(5);
  loadELearningData();
  List<ElearningData> musicList = new List<ElearningData>();
  for(ElearningData data in list){
    if (data.category == "Music"){
      musicList.add(data);
    }
  }
  logger.i("returning music list" + musicList.length.toString());
  return musicList;
}
Future<List<ElearningData>> loadELearningDanceData() async {
  var logger = Logger();
  await wait(5);
  
  loadELearningData();
  List<ElearningData> danceList = new List<ElearningData>();
  for(ElearningData data in list){
    if (data.category == "Dance"){
      danceList.add(data);
    }
  }
  logger.i("returning dance list" + danceList.length.toString());
  return danceList;
}
Future<List<ElearningData>> loadELearningGardenData() async {
  var logger = Logger();
  await wait(5);
  loadELearningData();
  List<ElearningData> gardenList = new List<ElearningData>();
  for(ElearningData data in list){
    if (data.category == "Gardening"){
      gardenList.add(data);
    }
  }
  logger.i("returning garden list" + gardenList.length.toString());
  return gardenList;
}

}