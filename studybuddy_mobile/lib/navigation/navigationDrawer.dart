import 'package:flutter/material.dart';

class NavigationDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Instillinger'),
                onTap: () {
                   Navigator.pushNamed(context, '/settings');
                   Navigator.pop(context);
                }
              ),
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Send tilbakemelding'),
                //onTap: () => Navigator.pushNamed(context, '/'),
              )
            ],
          ),
        ),
      );
  }
}

