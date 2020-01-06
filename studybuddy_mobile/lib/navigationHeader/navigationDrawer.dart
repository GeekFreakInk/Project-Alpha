import 'package:flutter/material.dart';

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
                title: Text('Hjem'),
                onTap: () => Navigator.pushNamed(context, '/home'),
              ),
              ListTile(
                leading: Icon(Icons.group),
                title: Text('Finn studybuddy'),
                onTap: () => Navigator.pushNamed(context, '/studyBuddy'),
              ),
              ListTile(
                leading: Icon(Icons.school),
                title: Text('Privatundervisning'),
                onTap: () => Navigator.pushNamed(context, '/privateLessons'),
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
                title: Text('Matte'),
                //onTap: () => Navigator.pushNamed(context, '/'),
              ),
              Container(
                color: Colors.grey[200],
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Språk'),
                  trailing: Icon(Icons.keyboard_arrow_right),
                  //This should change according to state, for now it just 
                  //demostrates the capability
                  selected: true,
                  //onTap: () => Navigator.pushNamed(context, '/'),
                )),
              new Divider(height: 14.0, color: Colors.grey, indent: 15, endIndent: 15,),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Instillinger'),
                onTap: () => Navigator.pushNamed(context, '/settings'),                
              ),
             
              ListTile(
                leading: Icon(Icons.feedback),
                title: Text('Send tilbakemelding'),
                onTap: () => Navigator.pushNamed(context, '/feedback'),
              )
            ],
          ),
        );
  }
}
  