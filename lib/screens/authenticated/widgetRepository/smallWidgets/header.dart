
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/shared/routeConstants.dart';

class Header extends StatelessWidget{
  
  @override
  Widget build(BuildContext context) {
    return Column(children : <Widget>[
    Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      IconButton(
        icon: Icon(Icons.notifications),
        tooltip: 'Here is your notifications',
        onPressed: () {
           Navigator.pushNamed(context, notisRoute);
        }),
        IconButton(
        icon: Icon(Icons.person),
        tooltip: 'Go to your profile',
        onPressed: () {
          Navigator.pushNamed(context, profileRoute);
        }),
    ])]);
  }
}