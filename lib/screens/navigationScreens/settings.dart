import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybuddy_mobile/app_localization.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/mediumWidgets/settings.dart';
import 'package:studybuddy_mobile/shared/constants.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();  
  
}

class _SettingsPageState extends State<SettingsPage>{
  bool isAdmin = false;
  bool hasDebugRights = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override 
  void initState() {
    super.initState();
    fetchUser();
  }

  @override
  void setState(fn){
    if(mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if(isAdmin != null){
     return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("settings_")),
        ),

        body: ListView(children: <Widget>[
          if(isAdmin || hasDebugRights)
            Container(
            margin: EdgeInsets.all(10),
            child: ListTile(leading: Icon(Icons.edit_attributes),title: Text("Admin panel"), onTap: (){ Navigator.pushNamed(context, adminPanelRoute);}),
            ),
            
        
          Container(
          margin: EdgeInsets.all(35),
          child: Settings(),
          ),
         
          
        ]));
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("settings_")),
        ),
        body: Container(
            child: ListView(
              children: <Widget>[
           Text("Laster inn dine instillinger"),
           CircularProgressIndicator()
      ])));
  }

  fetchUser() async {
    final FirebaseUser user = await auth.currentUser();
    var connection = new PostgreSQLConnection("10.0.2.2", 5432, "study_app", username: "postgres", password: "psqlGFdb");
    await connection.open();
    try{
      dynamic result = await connection.query("SELECT * FROM users WHERE id = '${user.uid}'");
      if(result[0][3] == true){
        setState(() {
          isAdmin = true;
        });
      }else{
        setState(() {
          isAdmin = false;
        });
      }
      canDebug();
    }catch(e){
     setState(() {
        isAdmin = false;
        hasDebugRights = false;
      });
    }
    
    await connection.close(); //Always close the connection after query is done  
  }

  Future<void> canDebug() async{
    final prefs = await SharedPreferences.getInstance();
    setState((){
      hasDebugRights = prefs.getBool("debugMode") != null ? true : false;
    }); 
  }
}