import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:hack_covid19/models/recipesData.dart';
import 'package:logger/logger.dart';

class RecipeAPIProvider {

static List<RecipesData> list = new List<RecipesData>();
var logger = Logger();
  Future<String> _loadRecipeAsset() async {
  logger.i("loading data new place");
  return await rootBundle.loadString('backup_json_api/new_recipe_template.json');
}

Future<List<RecipesData>> loadRecipesData() async {
  
  await wait(5);
  String jsonString = await _loadRecipeAsset(); 

list=(json.decode(jsonString) as List).map((i) =>
              RecipesData.fromJson(i)).toList();
  logger.i("list is " + list.length.toString());
  return list;
}

Future wait(int seconds) {
  return new Future.delayed(Duration(seconds: seconds), () => {});
}
Future<List<RecipesData>> loadStarterData() async {
  var logger = Logger();
  
 loadRecipesData();
  List<RecipesData> starterList = new List<RecipesData>();
  logger.i("list length within starter method" +list.length.toString());
  for(RecipesData data in list){
    logger.i("category"+data.category);
    if (data.category == "Starter"){
      starterList.add(data);
    }
  }
  logger.i("returning starter list" + starterList.length.toString());
  return starterList;
}
Future<List<RecipesData>> loadMainCourseData() async {
  var logger = Logger();
  
  await wait(5);
 loadRecipesData();
  List<RecipesData> mainCourseList = new List<RecipesData>();
  for(RecipesData data in list){
    if (data.category == "Main Course"){
      mainCourseList.add(data);
    }
  }
  logger.i("returning main course list" + mainCourseList.length.toString());
  return mainCourseList;
}
Future<List<RecipesData>> loadDessertData() async {
  var logger = Logger();
  await wait(5);
  loadRecipesData();
  List<RecipesData> dessertList = new List<RecipesData>();
  for(RecipesData data in list){
    if (data.category == "Dessert"){
      dessertList.add(data);
    }
  }
  logger.i("returning dessert list" + dessertList.length.toString());
  return dessertList;
}
Future<List<RecipesData>> loadBeveragesData() async {
  var logger = Logger();
  await wait(5);
  
  loadRecipesData();
  List<RecipesData> beveragesList = new List<RecipesData>();
  for(RecipesData data in list){
    if (data.category == "Beverages"){
      beveragesList.add(data);
    }
  }
  logger.i("returning beverages list" + beveragesList.length.toString());
  return beveragesList;
}


}