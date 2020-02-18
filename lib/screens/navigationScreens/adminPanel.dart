import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'adminPanel/adminSettings.dart';
import 'adminPanel/userManagement.dart';

class AdminPanel extends StatelessWidget{

  final List<Widget> containers = [
    Container(
      child: AdminSettings()),
    Container(
      child: UserManagement()),
    ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
      appBar: AppBar(
        title: Text("AdminPanel"),
        bottom: TabBar(
          tabs: <Widget>[
            Tab(text: "DEBUG settings"),
            Tab(text: "User management"),
          ],
        ),
      ),
      body:TabBarView(children: containers),
    ));
  }
}