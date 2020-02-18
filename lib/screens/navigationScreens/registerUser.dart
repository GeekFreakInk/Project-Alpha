import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/registration/step1.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/registration/step2.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/registration/step3.dart';

class _RegisterUserState extends State<RegisterUser>{
  int step = 1;
  final List<Widget> widgets = [UserType(), Step1(), Step2(), Step3()];
  @override
  Widget build(BuildContext context) {
    return widgets[step];
  }
}

class UserType extends StatelessWidget{
@override
  Widget build(BuildContext context) {
    return Container(
    color: Colors.white,
    child:GridView.count(
      primary: false,
      padding: const EdgeInsets.only(top: 200),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
         GestureDetector(
          onTap: ()=> {},
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Align( alignment: Alignment.center, child: const Text("Lærere"),),
            color: Colors.black,
          )
        ),
        GestureDetector(
          onTap: ()=> {},
          child:  Container(
          padding: const EdgeInsets.all(8),
          child: Align( alignment: Alignment.center, child: const Text("Elev")),
          color: Colors.black,
          )
        ),
      ]
    ));
  }
}

class RegisterUser extends StatefulWidget{
  @override
  _RegisterUserState createState() => new _RegisterUserState();
}