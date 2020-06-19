

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/home/home_bloc.dart';
import '../models/category/category.dart';

class Fitness extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FitnessState();
      }
      
    }
  
    
class _FitnessState extends State<Fitness> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Home')
      ),
      body: new Container(
         
        child: new Column(
          children: <Widget>[
            new Row(),
            new Row(),
          ],)
      ),
    );
  }
  
}
class LearningWidgetCategory extends StatefulWidget {
  @override
  _LearningWidgetCategoryState createState() => _LearningWidgetCategoryState();
}

class _LearningWidgetCategoryState extends State<LearningWidgetCategory> {
  final listCategories = [
    Category('assets/images/dance.png', 'Dance'),
    Category('assets/images/yoga.jpg', 'Yoga'),
    Category('assets/images/zumba.png', 'Zumba'), 
    Category('assets/images/general.png', 'General'),  

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

