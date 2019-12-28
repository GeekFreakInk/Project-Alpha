import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  // Will be displayed when the corresponding tab gets selected
  final List<Widget> containers = [
    Container(
        child: Center(
      child: Text('Hjem'),
    )),
    Container(
        child: Center(
      child: Text('Dine kurs'),
    )),
    Container(
        child: Center(
      child: Text('StudyBuddies'),
    )),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Hjem'),
                //onTap: () => Navigator.pushNamed(context, '/'),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Finn studybuddy'),
                //onTap: () => Navigator.pushNamed(context, '/'),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Privatundervisning'),
                //onTap: () => Navigator.pushNamed(context, '/'),
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text("Hjem"),
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
                text: 'StudyBuddies',
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
