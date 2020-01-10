import 'package:flutter/material.dart';
import '../../shared/constants.dart';
import 'package:studybuddy_mobile/app_localization.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: ListView(
            children: <Widget>[
              Align(
                alignment: Alignment.topRight,
               child: Icon(
                Icons.filter_list
                //onTap: () => Navigator.pushNamed(context, '/home'),
              )),
              ListTile(
                //if already on home, just pull back drawer
                leading: Icon(Icons.home),
                title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("home")),
                onTap: () => Navigator.pushNamed(context, homeRoute),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("find_sb")),
                onTap: () => Navigator.pushNamed(context, studyBuddyRoute),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("privateLessons")),
                onTap: () => Navigator.pushNamed(context, privateLessonsRoute),
              ),
              new Divider(height: 14.0, color: Colors.grey, indent: 15, endIndent: 15,),
              Align(
                alignment: Alignment.centerRight,
              child:Icon(
                Icons.filter_list
                //onTap: () => Navigator.pushNamed(context, '/home'),
              )),
              ListTile(
                leading: Icon(Icons.category),
                title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("math")),
                //onTap: () => Navigator.pushNamed(context, '/'),
              ),
              Container(
                color: Colors.grey[200],
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("languages")),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  //This should change according to state
                  selected: true,
                  //onTap: () => Navigator.pushNamed(context, '/'),
                )),
              new Divider(height: 14.0, color: Colors.grey, indent: 15, endIndent: 15,),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("settings")),
                onTap: () => Navigator.pushNamed(context, settingsRoute),                
              ),
             
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("feedback")),
                onTap: () => Navigator.pushNamed(context, feedbackRoute),
              )
            ],
          ),
        );
  }
}
  