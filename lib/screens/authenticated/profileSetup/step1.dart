import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/authenticated/widgetRepository/mediumWidgets/bigCheckbox.dart';
import 'package:studybuddy_mobile/screens/authenticated/widgetRepository/smallWidgets/academicLevel.dart';
import 'package:studybuddy_mobile/screens/authenticated/widgetRepository/smallWidgets/languageSelect.dart';

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
           LanguageSelect(),
           SizedBox(height: 5,),
           Divider(thickness: 0.5, color: Colors.black38,),
           BigCheckbox(),
           Align(alignment: Alignment.bottomRight, child:
           Padding(padding: EdgeInsets.all(5), child: Text("3/3 fag valgt"),))
            
          ],
        ),
        ],
      )
    );
  }
}