import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class Home extends StatefulWidget{

  @override
  _HomeState createState() => new _HomeState();

}

class _HomeState extends State<Home>{
  //App blueprint specific
  List<List<String>> myList =[["Permissions", "lib/screens/home/containers/courses.dart"], 
  ["WebViews", "lib/screens/navigationScreens/exploreWidgets/explore_math.dart"],
  ["Authentication", "lib/screens/authenticate/authenticate.dart"], ["Localization", "app_localization.dart"], 
  ["API Calls", "lib/screens/authenticate/register.dart"],
  ["Widget repository", "lib/screens/navigationScreens/widgetsRepository.dart"], 
  ["Statefull Widgets","lib/screens/navigationScreens/settings.dart"]];

  @override
  Widget build(BuildContext context){
    return  Scaffold(
      body:  GridView.count(
        crossAxisCount: 2,
        children:  List<Widget>.generate(6, (index) {
          return  GridTile(
            child:  Card(
              color: Colors.deepOrange.shade400,
              child:  ListView(
                children:<Widget>[
                SizedBox(height: 50),
                Center(child:Text('${myList[index][0]}'),),
                Center(child: Text('fil: ${myList[index][1]}', style: TextStyle(fontSize: 12.5, fontWeight: FontWeight.bold),),)
              ]),
            ),
          );
        }),
      ),
    );
  }
  
}