// //step -1 import the http package post adding it dependency in pubspec.yml
// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

class ElearningData {
  String category;
  String title;
  String summary;
  String link;
  String author;

  ElearningData(
      {this.category, this.title, this.summary, this.link, this.author});

  ElearningData.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    title = json['title'];
    summary = json['summary'];
    link = json['link'];
    author = json['author'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['title'] = this.title;
    data['summary'] = this.summary;
    data['link'] = this.link;
    data['author'] = this.author;
    return data;
  }
}

// Future<ElearningData> fetchElearningData() async {
//   final response = await http.get('http://api.springernature.com/metadata/pam?q=subject:Covid-19&api_key=3a7469fb6cb8df6570b75daf6ae3c550');
//   print(json.decode(response.body).cast<Map<String, dynamic>>());
//   debugPrint(response.body[1]);
//   if (response.statusCode == 200) {
//     return ElearningData.fromJson(json.decode(response.body[1]));
//   }
//   else {
//     throw Exception('Failed to load Elearning data');
//   }
// }