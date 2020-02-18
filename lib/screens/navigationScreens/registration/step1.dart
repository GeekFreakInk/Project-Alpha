import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/smallWidgets/academicLevel.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/smallWidgets/languageSelect.dart';

class Step1 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Text("Hva ønsker du hjelp til?", style: TextStyle(fontSize: 22, color: Colors.black,), textAlign: TextAlign.center),
          
         Column(children: <Widget>[
           SizedBox(height: 25,),
           Align(alignment: Alignment.centerRight,
           child: AcademicLevel(),),
           SizedBox(height: 25,),
           Align(alignment: Alignment.center, child:Text("Språk"),),
           LanguageSelect()
            
          ],
        ),
        ],
      )
    );
  }
}