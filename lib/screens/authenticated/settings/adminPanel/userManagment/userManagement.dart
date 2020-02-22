import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/shared/routeConstants.dart';

class UserManagement extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(20),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        GestureDetector(
          onTap: ()=> {},
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Align( alignment: Alignment.center, child: const Text("Lærere"),),
            color: Colors.deepOrange.shade400,
          )
        ),
        GestureDetector(
          onTap: ()=> {},
          child:  Container(
          padding: const EdgeInsets.all(8),
          child: Align( alignment: Alignment.center, child: const Text("Elev")),
          color: Colors.deepOrange.shade400,
          )
        ),
        GestureDetector(
          onTap: () => {},
          child: Container(
          padding: const EdgeInsets.all(8),
          child: Align(alignment: Alignment.center, child:  const Text("Admin")),
          color: Colors.deepOrange.shade400,
          ),
        ),
        GestureDetector(
          onTap: () =>{},
          child: Container(
          padding: const EdgeInsets.all(8),
          child: Align( alignment: Alignment.center, child: const Text("Moderatorer")),
          color: Colors.deepOrange.shade400,
        ),),
        GestureDetector(
          onTap: (){ Navigator.pushNamed(context, usersRoute);},
          child: Container(
          padding: const EdgeInsets.all(8),
          child: Align( alignment: Alignment.center, child: const Text("Alle brukere")),
          color: Colors.deepOrange.shade400,
        ),),
      ],
    );
  }
}