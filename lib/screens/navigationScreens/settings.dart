import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';
import 'package:studybuddy_mobile/app_localization.dart';



class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => new _SettingsState();  
  
}

class _SettingsState extends State<Settings>{
  bool isAdmin = false;
  final FirebaseAuth auth = FirebaseAuth.instance;

  @override 
  void initState() {
    super.initState();
    connection();
  }

  @override
  void setState(fn){
    if(mounted){
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    if(isAdmin && isAdmin != null){
     return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("settings_")),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du endre Admin instillinger'),
      ))
    );
    }
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("settings_")),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du endre dine instillinger'),
      ))
    );
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
    }
    await connection.close(); //Always close the connection after query is done  
  }
}