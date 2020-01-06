import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/app_localization.dart';
import 'package:studybuddy_mobile/navigationHeader/navigationDrawer.dart';
import 'containers/home.dart';
import 'containers/studybuddies.dart';
import 'containers/courses.dart';

class HomePage extends StatelessWidget {
  // Will be displayed when the corresponding tab gets selected
  final List<Widget> containers = [
    //Make the containers in seperate dart files
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
          title: Text("Hjem"),//Text(AppLocalizations.of(context).translate('test')),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications),
              onPressed: () {
                Navigator.pushNamed(context, '/notis');
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              
              },
            ),
          ],
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Hjem',
              ),
              Tab(
                text: 'Dine kurs',
              ),
              Tab(
                text: 'Studybuddies',
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
