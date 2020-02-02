import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/shared/constants.dart';
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
                title: Text(AppLocalizations.of(context).translate("home_")),
                onTap: () {Navigator.pop(context); Navigator.pushNamed(context, homeRoute);}
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text(AppLocalizations.of(context).translate("findSB_")),
                onTap: () {Navigator.pop(context); Navigator.pushNamed(context, studyBuddyRoute);}
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text(AppLocalizations.of(context).translate("privateLessons_")),
                onTap: () {Navigator.pop(context);  Navigator.pushNamed(context, privateLessonsRoute);}
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
                title: Text(AppLocalizations.of(context).translate("math_")),
                onTap: () => Navigator.pushNamed(context, mathRoute),
              ),
              Container(
                color: Colors.grey[200],
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text(AppLocalizations.of(context).translate("languages_")),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  //This should change according to state
                  selected: true,
                  //onTap: () => Navigator.pushNamed(context, '/'),
                )),
              new Divider(height: 14.0, color: Colors.grey, indent: 15, endIndent: 15,),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text(AppLocalizations.of(context).translate("settings_")),
                onTap: () { Navigator.pop(context); Navigator.pushNamed(context, settingsRoute);},                
              ),
              ListTile(
                leading: Icon(Icons.archive),
                title: Text(AppLocalizations.of(context).translate("widgetsRepository_")),
                //onTap: () { Navigator.pop(context); Navigator.pushNamed(context, widgetsRepositoryRoute);},                
              ),
             
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text(AppLocalizations.of(context).translate("feedback_")),
                onTap: ()  {Navigator.pop(context); Navigator.pushNamed(context, feedbackRoute);}
              )
            ],
          ),
        );
  }
}
  