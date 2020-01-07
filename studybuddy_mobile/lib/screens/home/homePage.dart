import 'package:flutter/material.dart';
import '../../shared/constants.dart';
import 'package:studybuddy_mobile/app_localization.dart';
import 'package:studybuddy_mobile/screens/navigationHeader/navigationDrawer.dart';
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
          title: Text(AppLocalizations.of(context).translate('home')),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, notisRoute);
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, profileRoute);
              
              },
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: AppLocalizations.of(context).translate('home'),
              ),
              Tab(
                text: AppLocalizations.of(context).translate('course'),
              ),
              Tab(
                text: AppLocalizations.of(context).translate('studyBuddies'),
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
