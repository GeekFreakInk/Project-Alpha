import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/authenticated/widgetRepository/smallWidgets/header.dart';
import 'package:studybuddy_mobile/screens/authenticated/navigationDrawer.dart';
import 'package:studybuddy_mobile/shared/app_localization.dart';
import 'containers/home.dart';
import 'containers/studybuddies.dart';
import 'containers/courses.dart';

class HomePage extends StatelessWidget {
  // Will be displayed when the corresponding tab gets selected
  final List<Widget> containers = [
    Container(
        child: Home()),
    Container(
        child: Courses()),
    Container(
        child: StudyBuddies()),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: NavigationDrawer(),
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("home_")),
          actions: <Widget>[
            Header(),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: /*AppLocalizations.of(context).translate("home_")*/"Overview",
              ),
              Tab(
                text: /*AppLocalizations.of(context).translate("course_")*/ "Permissions",
              ),
              Tab(
                text: /*AppLocalizations.of(context).translate("studyBuddies_")*/ "Documentation",
              )
            ],
          ),
        ),
        body: TabBarView(
          // Displays the body-widgets
          children: containers,
        ),
      ),
    );
  } 
}
