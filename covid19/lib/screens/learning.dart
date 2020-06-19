import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../bloc/home/home_bloc.dart';
import '../models/category/category.dart';


class Learning extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    
    return _LearningState();
  }
}

class _LearningState extends State<Learning> {
  final listCategories = [
    Category('assets/images/course.jpg', 'Technical'),
    Category('assets/images/crafts.jpg', 'Health'),
    Category('assets/images/garden.jpg', 'Garden'),   
  ];
  
  int indexSelectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    
    return new Scaffold(
      appBar: new AppBar(title: new Text('E-Learning1')),
      body: new Container(
        height: 50,
        color: Colors.black,
          child:  ListView.builder(
            scrollDirection: Axis.horizontal,
        itemCount: listCategories.length,
        itemBuilder: (context, index) {
          ListTile(title: Text(listCategories[index].title));
          
        
  }
      )),
    );
  }
}
/** 
Widget buildListView(BuildContext context) {
    return FutureBuilder<List<Job>>(
      future: _fetchJobs(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Job> data = snapshot.data;
          return _jobsListView(data);
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
 Future<List<Job>> _fetchJobs() async {

    final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
    final response = await http.get(jobsListAPIUrl);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((job) => new Job.fromJson(job)).toList();
    } else {
      throw Exception('Failed to load jobs from API');
    }
  }
ListView _jobsListView(data) {
    return ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return _tile(data[index].position, data[index].company, Icons.work);
        });
  }
 ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
        title: Text(title,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
            )),
        subtitle: Text(subtitle),
        leading: Icon(
          icon,
          color: Colors.blue[500],
        ),
      );
}
**/

