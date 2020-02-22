import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studybuddy_mobile/screens/authenticated/widgetRepository/mediumWidgets/settings.dart';
import 'package:studybuddy_mobile/services/usersAPI.dart';
import 'package:studybuddy_mobile/shared/app_localization.dart';
import 'package:studybuddy_mobile/shared/routeConstants.dart';

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
    _fetchUser();
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

  _fetchUser() async {
    final FirebaseUser user = await auth.currentUser();
    var result = await fetchUser(user);
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
  }

  Future<void> canDebug() async{
    final prefs = await SharedPreferences.getInstance();
    setState((){
      hasDebugRights = prefs.getBool("debugMode") != null ? true : false;
    }); 
  }
}