import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:studybuddy_mobile/app_localization.dart';
import "package:shared_preferences/shared_preferences.dart";
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/mediumWidgets/settings.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();  
  
}

class _SettingsPageState extends State<SettingsPage>{
  bool isAdmin = false;
  String _haveStarted3Times = '';
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override 
  void initState() {
    super.initState();
    connection();
    _incremetnStartUp();
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
          if(isAdmin)
            Container(
            margin: EdgeInsets.all(10),
            child: ListTile(leading: Icon(Icons.edit_attributes),title: Text("Admin panel"), onTap: (){},),
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

  connection() async {
    final FirebaseUser user = await auth.currentUser();
    var connection = new PostgreSQLConnection("10.0.2.2", 5432, "study_app", username: "postgres", password: "psqlGFdb");
    await connection.open();
    dynamic result = await connection.query("SELECT * FROM users WHERE id = '${user.uid}'");
    if(result[0][3] == true){
      setState(() {
        isAdmin = true;
      });
    }else if(result[0][3] == false){
        setState(() {
          isAdmin = false;
    });
    }
    await connection.close(); //Always close the connection after query is done  
  }


  Future<int> _getIntFromSharedPref() async {
    final prefs = await SharedPreferences.getInstance();
    final startupNumber = prefs.getInt('startupNumber');

    if(startupNumber == null){
      return 0;
    }
    return startupNumber;
  }
  Future<void> _resetCounter() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('startupNumber', 0);
  }

  Future<void> _incremetnStartUp() async{
    final prefs = await SharedPreferences.getInstance();
    int lastStartupNumber = await _getIntFromSharedPref();
    int currentStartupNumber = ++ lastStartupNumber;
    await prefs.setInt('startupNumber', currentStartupNumber);

    if(currentStartupNumber == 3){
      setState(()=> _haveStarted3Times = '$currentStartupNumber Times Completed');
      await _resetCounter();
    }else{
      setState(() => _haveStarted3Times = '$currentStartupNumber Times started the app');
    }
  }
}