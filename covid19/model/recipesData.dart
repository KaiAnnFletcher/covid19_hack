import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipesData {
  List<Results> results;
  String baseUri;
  int offset;
  int number;
  int totalResults;
  int processingTimeMs;
  int expires;
  bool isStale;

  RecipesData(
      {this.results,
      this.baseUri,
      this.offset,
      this.number,
      this.totalResults,
      this.processingTimeMs,
      this.expires,
      this.isStale});

  RecipesData.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = new List<Results>();
      json['results'].forEach((v) {
        results.add(new Results.fromJson(v));
      });
    }
    baseUri = json['baseUri'];
    offset = json['offset'];
    number = json['number'];
    totalResults = json['totalResults'];
    processingTimeMs = json['processingTimeMs'];
    expires = json['expires'];
    isStale = json['isStale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }
    data['baseUri'] = this.baseUri;
    data['offset'] = this.offset;
    data['number'] = this.number;
    data['totalResults'] = this.totalResults;
    data['processingTimeMs'] = this.processingTimeMs;
    data['expires'] = this.expires;
    data['isStale'] = this.isStale;
    return data;
  }
}

class Results {
  int id;
  String title;
  int readyInMinutes;
  String image;
  List<String> imageUrls;

  Results(
      {this.id, this.title, this.readyInMinutes, this.image, this.imageUrls});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    readyInMinutes = json['readyInMinutes'];
    image = json['image'];
    imageUrls = json['imageUrls'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['readyInMinutes'] = this.readyInMinutes;
    data['image'] = this.image;
    data['imageUrls'] = this.imageUrls;
    return data;
  }
}

Future<RecipesData> fetchRecipesData() async {
  final response = await http.get('https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/search?diet=vegetarian&excludeIngredients=coconut&intolerances=egg%252C%20gluten&number=10&offset=0&type=main%20course&query=burger',
  headers: {HttpHeaders.authorizationHeader: "0b6d4040a6msh8925aeab92fa3b4p142c2ajsnc82bcee5674c"},
  );

  print(json.decode(response.body).cast<Map<String, dynamic>>());
  debugPrint(response.body[1]);
  if (response.statusCode == 200) {
    return RecipesData.fromJson(json.decode(response.body[1]));
  }
  else {
    throw Exception('Failed to load Recipes data');
  }
  }
