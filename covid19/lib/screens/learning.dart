import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hack_covid19/models/elearningData.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/category/category.dart';
import 'package:logger/logger.dart';

Future<String> _loadELearningAsset() async {
  Logger().i("loading data");
  return await rootBundle.loadString('backup_json_api/elearning.json');
}

Future<List<ElearningData>> loadELearningData() async {
  var logger = Logger();
  await wait(5);
  List<ElearningData> list = new List<ElearningData>();
  String jsonString = await _loadELearningAsset(); 
logger.i(jsonString);
list=(json.decode(jsonString) as List).map((i) =>
              ElearningData.fromJson(i)).toList();
  logger.i("list is " + list.length.toString());
  return list;
}


Future wait(int seconds) {
  return new Future.delayed(Duration(seconds: seconds), () => {});
}

class Learning extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LearningState();
  }
}

class _LearningState extends State<Learning> {
 
 static List<ElearningData> _elearningData = new List<ElearningData>();
var logger = Logger();
  bool _loaded = false;
  
  @override
  void initState() {
    super.initState();
    loadELearningData().then((s) => setState(() {
          _elearningData = s;
          _loaded = true;
        }));
        logger.i("elearning data is " +_elearningData.toString());
  }
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    logger.i("start");
    return new Scaffold(
      // appBar: new AppBar(title: new Text('E-Learning1')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.red, //Color(0xFFF1F5F9),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.only(
              top: mediaQuery.padding.top + 10.0,
              //bottom: 16.0,
            ),
            child: Column(
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    WidgetTitle(),
                  ],
                ),
                /*SizedBox(height: 8.0),
                  buildWidgetSearch(),*/
                //SizedBox(height: 8.0),
                LearningStateCategory(),
              ],
            ),
          ),
          // SizedBox(height: 5.0),
          // _buildWidgetLabelLatestNews(context),
          //_buildWidgetSubtitleLatestNews(context),
          Expanded(
             child: buildDisplayContent(_elearningData),
          ),
        ],
      ),
    );
  }
}
Widget buildContent (ElearningData _elearningData ,MediaQuery mediaQuery){

  return GestureDetector(
                   onTap: () async {
                if (await canLaunch(_elearningData.link)) {
                  await launch(_elearningData.link);
                }},
                child: Container(
               // width: mediaQuery.width,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                        height: 72.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              _elearningData == null ?'': _elearningData.title,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                              style: TextStyle(
                                fontSize: 16.0,
                                color: Color(0xFF325384),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: <Widget>[
                                Icon(
                                  Icons.launch,
                                  size: 12.0,
                                  color: Color(0xFF325384).withOpacity(0.5),
                                ),
                                SizedBox(width: 4.0),
                                Text(
                                  _elearningData == null ?'':_elearningData.link,
                                  style: TextStyle(
                                    color: Color(0xFF325384).withOpacity(0.5),
                                    fontSize: 12.0,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    ],
                ),
              ),
            
                );
              
}
Widget buildDisplayContent (List<ElearningData> data) {
 if (data.length < 1) {
   return Text('Loading data from server.');
 } else {
   return GestureDetector(
                  onTap: () async {
                    if (await canLaunch(data[0].link)) {
                      await launch(data[0].link);
                    } 
                  },
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 12.0,
                        right: 12.0,
                      ),
                      child: Text(
                        data[0].title,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        top: 4.0,
                        right: 12.0,
                      ),
                      child: Wrap(
                        children: <Widget>[
                          Icon(
                            Icons.launch,
                            color: Colors.white.withOpacity(0.8),
                            size: 12.0,
                          ),
                          SizedBox(width: 4.0),
                          Text(
                            '${data[0].author}',
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              
             
      );
    
 }
}

class WidgetTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'E-learning\n',
                style: Theme.of(context).textTheme.title.merge(
                      TextStyle(
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LearningStateCategory extends StatefulWidget {
  @override
  _LearningStateCategoryState createState() => _LearningStateCategoryState();
}

class _LearningStateCategoryState extends State<LearningStateCategory> {


  final listCategories = [
    Category('assets/images/course.jpg', 'Programming'),
    Category('assets/images/crafts.jpg', 'Dance'),
    Category('assets/images/music.png', 'Music'),
    Category('assets/images/garden.png', 'Gardening'),
    Category('assets/images/diy.jpg', 'DIY'),
  ];

  int indexSelectedCategory = 0;

  

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return Container(
      color: Colors.red, //Color(0xFFE3998A),//Color(0xFFB12D22),//Colors.red,
      height: 74,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Category itemCategory = listCategories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: 16.0,
            ),
            child: Column(
              children: <Widget>[
                //SizedBox(height: 5,),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSelectedCategory = index;
                      
                    });
                  },
                  child: Container(
                    width: 45.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(itemCategory.image),
                        fit: BoxFit.fill,
                      ),
                      border: indexSelectedCategory == index
                          ? Border.all(
                              color: Colors.white.withOpacity(
                                  0.9), //Color(0xFF4F4140),//Colors.red,
                              width: 5.0,
                            )
                          : null,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  itemCategory.title,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87, // Color(0xFF325384),
                    fontWeight: indexSelectedCategory == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                ],
            ),
          );
        },
        itemCount: listCategories.length,
      ),
    );
  }
}


Widget buildListView(BuildContext context,ElearningData data) {
    return _ContentListView(data);
}
 
ListView _ContentListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].title, data[index].summary, data[index].link,data[index].author);
        });
  }
 ListTile _tile(String title, String summary, String link, String author) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              
            )),
        subtitle: Text(summary,
                        overflow: TextOverflow.ellipsis,
        ),
        
        
      );


