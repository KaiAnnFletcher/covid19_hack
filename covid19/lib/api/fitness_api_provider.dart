import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hack_covid19/models/fitnessData.dart';
import 'package:logger/logger.dart';

class FitnessApiProvider {

static List<FitnessData> list = new List<FitnessData>();
var logger = Logger();
  Future<String> _loadingFitnessAsset() async {
  logger.i("loading fitness data new place");
  return await rootBundle.loadString('backup_json_api/fitness.json');
}

Future<List<FitnessData>> loadFitnessData() async {
  
  await wait(5);
  String jsonString = await _loadingFitnessAsset(); 

list=(json.decode(jsonString) as List).map((i) =>
              FitnessData.fromJson(i)).toList();
  logger.i(" fitness list is " + list.length.toString());
  return list;
}

Future wait(int seconds) {
  return new Future.delayed(Duration(seconds: seconds), () => {});
}
Future<List<FitnessData>> loadZumbaFitnessData() async {
  var logger = Logger();
  
 loadFitnessData();
  List<FitnessData> zumbaList = new List<FitnessData>();
  logger.i("list length within prograaming method" +list.length.toString());
  for(FitnessData data in list){
    logger.i("category"+data.category);
    if (data.category == "Zumba"){
      zumbaList.add(data);
    }
  }
  logger.i("returning zumba list" + zumbaList.length.toString());
  return zumbaList;
}
Future<List<FitnessData>> loadYogaFitnessData() async {
  var logger = Logger();
  
  await wait(5);
 loadFitnessData();
  List<FitnessData> yogaList = new List<FitnessData>();
  for(FitnessData data in list){
    if (data.category == "Yoga"){
      yogaList.add(data);
    }
  }
  logger.i("returning yoga  list" + yogaList.length.toString());
  return yogaList;
}
Future<List<FitnessData>> loadGeneralFitnessData() async {
  var logger = Logger();
  await wait(5);
  loadFitnessData();
  List<FitnessData> generalFitnessList = new List<FitnessData>();
  for(FitnessData data in list){
    if (data.category == "General Fitness"){
      generalFitnessList.add(data);
    }
  }
  logger.i("returning general fitness list" + generalFitnessList.length.toString());
  return generalFitnessList;
}


}