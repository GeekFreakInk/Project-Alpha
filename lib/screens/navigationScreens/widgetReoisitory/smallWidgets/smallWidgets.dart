import 'package:flutter/cupertino.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/smallWidgets/ReactionsOption.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/smallWidgets/academicLevel.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/smallWidgets/header.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/smallWidgets/languageSelect.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/smallWidgets/subscribe.dart';

class SmallWidgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView( 
        children: <Widget>[
          SizedBox(height: 25),
          Padding(padding: EdgeInsets.all(15),
          child:  Wrap(children: <Widget>[
            Column(children: <Widget>[
              Text("Subscribe"),
              Subscribe(),
            ],),
            Column(children: <Widget>[
              Text("Header"),
             Header(),
            ],),
            Column(children: <Widget>[
              Text("ReactionOptions"),
              ReactionOptions(),
            ],),
            Column(children: <Widget>[
              Text("AcademicLevel"),
              AcademicLevel(),
            ],),
            Column(children: <Widget>[
              SizedBox(height: 10,),
              Text("LanguageSelect"),
              SizedBox(height: 10,),
              LanguageSelect(),
            ],),
          ],)
    )]);
  }
}