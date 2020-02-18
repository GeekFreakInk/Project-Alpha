import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import "package:shared_preferences/shared_preferences.dart";

class _AdminSettingsState extends State<AdminSettings>{

  bool _debugMode = false;
  bool _avoidLogin = false;

  @override
  void initState() {
    super.initState();
    fetchAdminPanelPrefrences();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(children: <Widget>[
        Column(children: <Widget>[
          SwitchListTile(title: Text("DEBUG MODE"),
           value: _debugMode, 
           secondary: const Icon(Icons.warning),
           subtitle: Text("Must be on for other admin settings to work"), onChanged: (bool value){
             if(_debugMode) 
                Alert(context: context, title: "WARNING", desc: "You have to login as an admin "+
                "to get acess to this panel again. \n \n Do you want to continue?",
                buttons: [
                  DialogButton(child: Text("cancel"), onPressed:() =>  { Navigator.pop(context)}),
                  DialogButton(child: Text("continue"), onPressed: ()=> { setState(() {
                    _debugMode = value;
                    _updateValues("debugMode", _debugMode);
                    Navigator.pop(context);
                    })}),
                ]).show();
              else
                setState(() {
                  _debugMode = value;
                  _updateValues("debugMode", _debugMode);
                });
            },),
        ],),
        SizedBox(height: 50,),
         Column(children: <Widget>[
          SwitchListTile(title: Text("Avoid Login"),
           value: _avoidLogin, 
           secondary: const Icon(Icons.lock_open),
           subtitle: Text("Will sign you automaticly in with DEBUG credentials"), onChanged: (bool value) { setState(() {
             _avoidLogin = value;
           });
           _updateValues("avoidLogin", _avoidLogin);},),
          ],),
      ],);
  }

  Future<void> _updateValues(String prefString, bool setting) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(prefString, setting);
  }

  Future<void> fetchAdminPanelPrefrences() async{
    final prefs = await SharedPreferences.getInstance();
    bool debugMode = prefs.getBool("debugMode");
    debugMode == null ? await prefs.setBool("debugMode", false) : debugMode;

    bool avoidLogin = prefs.getBool("avoidLogin");
    avoidLogin == null ? await prefs.setBool("avoidLogin", false) : avoidLogin;
    
    Map loadedPrefs = {
      "debugMode": debugMode, 
      "avoidLogin": avoidLogin,
    };
    
    setState(() {
      _debugMode = loadedPrefs["debugMode"];
      _avoidLogin = loadedPrefs["avoidLogin"];
    });
  }
}

class AdminSettings extends StatefulWidget{
  @override
  _AdminSettingsState createState() => new _AdminSettingsState();
}