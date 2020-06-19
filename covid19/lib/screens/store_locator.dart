import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bloc/home/home_bloc.dart';
import '../models/category/category.dart';

class Learning1 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _LearningState();
  }
}

class _LearningState extends State<Learning1> {
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(title: new Text('E-Learning')),
      body: new Container(
          child: new Column(
        children: <Widget>[
          LearningWidgetCategory(),
          //new Row(),
        ],
      )),
    );
  }

 void _newsFunction() {
    Navigator.of(context).pushNamed('/News');
  }

  void _learningFunction() {
    Navigator.of(context).pushNamed('/Learning');
  }

  void _fitnessFunction() {
    Navigator.of(context).pushNamed('/Fitness');
  }

  void _healthFuntion() {
    Navigator.of(context).pushNamed('/Health');
  }
  Widget _buildTopRowContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 80.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            buildBarItem(Icons.book, _newsFunction, 'Technical'),
            buildBarItem(Icons.card_giftcard, _learningFunction, 'e-Learning'),
            buildBarItem(FontAwesomeIcons.tree, _fitnessFunction, 'Fitness'),
            buildBarItem(
                FontAwesomeIcons.music, _healthFuntion, 'Healthy Meals'),
          ],
        ),
      ),
    );
  }

Widget buildBarItem(
      IconData iconArgument, Function functionName, String name) {
    return Container(
         decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(3.0),
          //border: Border(left: BorderSide(width:3,color: Colors.orange,style: BorderStyle.solid)),
         // border: Border.all(width: 3.0,)
        ), 
        width: 80.0,
        margin: EdgeInsets.all(4.0),
        //color: Colors.white,
        
        child: Column(children: [
          IconButton(icon: Icon(iconArgument), onPressed: functionName),
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              
              color: Colors.black54,
            ),
          ),
        ])
        //child: Icon(icon),

        );
  }
}
class LearningWidgetCategory extends StatefulWidget {
  @override
  _LearningWidgetCategoryState createState() => _LearningWidgetCategoryState();
}

class _LearningWidgetCategoryState extends State<LearningWidgetCategory> {
  final listCategories = [
    Category('assets/images/course.jpg', 'Technical'),
    Category('assets/images/crafts.jpg', 'Health'),
    Category('assets/images/garden.jpg', 'Garden'),   
  ];
  int indexSelectedCategory = 0;

  @override
  void initState() {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    homeBloc.dispatch(DataEvent(listCategories[indexSelectedCategory].title));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeBloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      color: Colors.red,//Color(0xFFE3998A),//Color(0xFFB12D22),//Colors.red,
      height: 74,
      child: ListView.builder(
        shrinkWrap: false,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          Category itemCategory = listCategories[index];
          return Padding(
            padding: EdgeInsets.only(
              left: 16.0,
              right: index == listCategories.length - 1 ? 16.0 : 0.0,
            ),
            child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    setState(() {
                      indexSelectedCategory = index;
                      homeBloc.dispatch(DataEvent(
                          listCategories[indexSelectedCategory].title));
                    });
                  },
                  child: index == 0
                      ? Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFFBDCDDE),
                            border: indexSelectedCategory == index
                                ? Border.all(
                                    color: Colors.white.withOpacity(0.8),//Color(0xFF4F4140),
                                    width: 5.0,
                                  )
                                : null,
                          ),
                          child: Icon(
                            Icons.apps,
                            color: Colors.white,
                          ),
                        )
                      : Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(itemCategory.image),
                              fit: BoxFit.fill,
                            ),
                            border: indexSelectedCategory == index
                                ? Border.all(
                                    color: Colors.white.withOpacity(0.9),//Color(0xFF4F4140),//Colors.red,
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
                    color: Colors.black87,// Color(0xFF325384),
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


