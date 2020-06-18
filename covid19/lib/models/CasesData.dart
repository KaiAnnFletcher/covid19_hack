//step -1 import the http package post adding it dependency in pubspec.yml
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Step-2 Create a method and add a network Rest API call .
/**Future<http.Response> fetchIndiaTotalCases() {
  return http.get('https://covid-19india-api.herokuapp.com/v2.0/country_data');
}**/

class CasesDataOutputJsonModel {
  String description;
  IndiaTotalCases casesData;

  
}
// Step-3 Create a model to convert the Json object into this modela and then use this model to build the widgets and populate data in them.
class IndiaTotalCases {
  final int activeCases;
  final int activeRate;
  final int confirmedCases;
  final int deathCases;
  final int deathRate;
  final int recoveredCases;
  final int recoveryRate;
  final DateTime lastUpdated;
  final passengersScreened;

  IndiaTotalCases(
      {this.deathRate,
      this.recoveredCases,
      this.recoveryRate,
      this.lastUpdated,
      this.passengersScreened,
      this.activeCases,
      this.activeRate,
      this.confirmedCases,
      this.deathCases});

  factory IndiaTotalCases.fromJson(Map<String, dynamic> json) {
    return IndiaTotalCases(
      activeCases: json['active_cases'],
      activeRate: json['active_rate'],
      confirmedCases: json['confirmed_cases'],
      deathCases: json['death_cases'],
      deathRate: json['death_rate'],
      recoveredCases: json['recovered_cases'],
      recoveryRate: json['recovered_rate'],
      lastUpdated: json['last_updated'],
      passengersScreened: json['passengers_screened'],
    );
  }
}


//Step- 4 Add login in method created in step -2 to convert http response  into the model object as created above.
// import dart convert package.
Future<IndiaTotalCases> fetchIndiaTotalCases() async {
  final response = await http.get('https://covid-19india-api.herokuapp.com/v2.0/country_data');
  print(json.decode(response.body).cast<Map<String,dynamic>>());
  debugPrint(response.body[1]);
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return IndiaTotalCases.fromJson(json.decode(response.body[1]));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load India toal cases');
  }
}

