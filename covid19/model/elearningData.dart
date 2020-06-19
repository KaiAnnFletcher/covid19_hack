//step -1 import the http package post adding it dependency in pubspec.yml
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ElearningData {
  String apiMessage;
  String query;
  String apiKey;
  List<Result> result;
  List<Records> records;
  List<Facets> facets;

  ElearningData(
      {this.apiMessage,
      this.query,
      this.apiKey,
      this.result,
      this.records,
      this.facets});

  ElearningData.fromJson(Map<String, dynamic> json) {
    apiMessage = json['apiMessage'];
    query = json['query'];
    apiKey = json['apiKey'];
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
    if (json['records'] != null) {
      records = new List<Records>();
      json['records'].forEach((v) {
        records.add(new Records.fromJson(v));
      });
    }
    if (json['facets'] != null) {
      facets = new List<Facets>();
      json['facets'].forEach((v) {
        facets.add(new Facets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['apiMessage'] = this.apiMessage;
    data['query'] = this.query;
    data['apiKey'] = this.apiKey;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    if (this.records != null) {
      data['records'] = this.records.map((v) => v.toJson()).toList();
    }
    if (this.facets != null) {
      data['facets'] = this.facets.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String total;
  String start;
  String pageLength;
  String recordsDisplayed;

  Result({this.total, this.start, this.pageLength, this.recordsDisplayed});

  Result.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    start = json['start'];
    pageLength = json['pageLength'];
    recordsDisplayed = json['recordsDisplayed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total'] = this.total;
    data['start'] = this.start;
    data['pageLength'] = this.pageLength;
    data['recordsDisplayed'] = this.recordsDisplayed;
    return data;
  }
}

class Records {
  String contentType;
  String identifier;
  List<Url> url;
  String title;
  List<Creators> creators;
  String publicationName;
  String issn;
  String eissn;
  String openaccess;
  String journalid;
  String doi;
  String publisher;
  String publicationDate;
  String onlineDate;
  String coverDate;
  String printDate;
  String volume;
  String number;
  String issuetype;
  String topicalCollection;
  String startingPage;
  String endingPage;
  String copyright;
  String genre;
  String articleCategory;
  String abstract;

  Records(
      {this.contentType,
      this.identifier,
      this.url,
      this.title,
      this.creators,
      this.publicationName,
      this.issn,
      this.eissn,
      this.openaccess,
      this.journalid,
      this.doi,
      this.publisher,
      this.publicationDate,
      this.onlineDate,
      this.coverDate,
      this.printDate,
      this.volume,
      this.number,
      this.issuetype,
      this.topicalCollection,
      this.startingPage,
      this.endingPage,
      this.copyright,
      this.genre,
      this.articleCategory,
      this.abstract});

  Records.fromJson(Map<String, dynamic> json) {
    contentType = json['contentType'];
    identifier = json['identifier'];
    if (json['url'] != null) {
      url = new List<Url>();
      json['url'].forEach((v) {
        url.add(new Url.fromJson(v));
      });
    }
    title = json['title'];
    if (json['creators'] != null) {
      creators = new List<Creators>();
      json['creators'].forEach((v) {
        creators.add(new Creators.fromJson(v));
      });
    }
    publicationName = json['publicationName'];
    issn = json['issn'];
    eissn = json['eissn'];
    openaccess = json['openaccess'];
    journalid = json['journalid'];
    doi = json['doi'];
    publisher = json['publisher'];
    publicationDate = json['publicationDate'];
    onlineDate = json['onlineDate'];
    coverDate = json['coverDate'];
    printDate = json['printDate'];
    volume = json['volume'];
    number = json['number'];
    issuetype = json['issuetype'];
    topicalCollection = json['topicalCollection'];
    startingPage = json['startingPage'];
    endingPage = json['endingPage'];
    copyright = json['copyright'];
    genre = json['genre'];
    articleCategory = json['articleCategory'];
    abstract = json['abstract'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contentType'] = this.contentType;
    data['identifier'] = this.identifier;
    if (this.url != null) {
      data['url'] = this.url.map((v) => v.toJson()).toList();
    }
    data['title'] = this.title;
    if (this.creators != null) {
      data['creators'] = this.creators.map((v) => v.toJson()).toList();
    }
    data['publicationName'] = this.publicationName;
    data['issn'] = this.issn;
    data['eissn'] = this.eissn;
    data['openaccess'] = this.openaccess;
    data['journalid'] = this.journalid;
    data['doi'] = this.doi;
    data['publisher'] = this.publisher;
    data['publicationDate'] = this.publicationDate;
    data['onlineDate'] = this.onlineDate;
    data['coverDate'] = this.coverDate;
    data['printDate'] = this.printDate;
    data['volume'] = this.volume;
    data['number'] = this.number;
    data['issuetype'] = this.issuetype;
    data['topicalCollection'] = this.topicalCollection;
    data['startingPage'] = this.startingPage;
    data['endingPage'] = this.endingPage;
    data['copyright'] = this.copyright;
    data['genre'] = this.genre;
    data['articleCategory'] = this.articleCategory;
    data['abstract'] = this.abstract;
    return data;
  }
}

class Url {
  String format;
  String platform;
  String value;

  Url({this.format, this.platform, this.value});

  Url.fromJson(Map<String, dynamic> json) {
    format = json['format'];
    platform = json['platform'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['format'] = this.format;
    data['platform'] = this.platform;
    data['value'] = this.value;
    return data;
  }
}

class Creators {
  String creator;

  Creators({this.creator});

  Creators.fromJson(Map<String, dynamic> json) {
    creator = json['creator'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['creator'] = this.creator;
    return data;
  }
}

class Facets {
  String name;
  List<Values> values;

  Facets({this.name, this.values});

  Facets.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['values'] != null) {
      values = new List<Values>();
      json['values'].forEach((v) {
        values.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.values != null) {
      data['values'] = this.values.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  String value;
  String count;

  Values({this.value, this.count});

  Values.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['count'] = this.count;
    return data;
  }
}

Future<ElearningData> fetchElearningData() async {
  final response = await http.get('http://api.springernature.com/metadata/pam?q=subject:Covid-19&api_key=3a7469fb6cb8df6570b75daf6ae3c550');
  print(json.decode(response.body).cast<Map<String, dynamic>>());
  debugPrint(response.body[1]);
  if (response.statusCode == 200) {
    return ElearningData.fromJson(json.decode(response.body[1]));
  }
  else {
    throw Exception('Failed to load Elearning data');
  }
}