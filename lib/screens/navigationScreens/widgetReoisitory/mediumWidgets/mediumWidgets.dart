import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/mediumWidgets/feedback.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/mediumWidgets/settings.dart';


class MediumWidgets extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView( 
        children: <Widget>[
          SizedBox(height: 25),
          Padding(padding: EdgeInsets.all(15),
          child:  Wrap(children: <Widget>[
            Text("Settings"),
            Settings(),
            Text("FeedBack"),
            FeedbackWidget(),
            /* FeedbackWidget(filledStar: Icon(Icons.star, color: Colors.amber,),
            unfilledStar: Icon(Icons.star_border, color: Colors.grey,)), */
        ],)
    )]);
  }
}