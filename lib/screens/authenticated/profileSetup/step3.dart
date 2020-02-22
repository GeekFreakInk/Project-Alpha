import 'package:flutter/material.dart';


class Step3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          Text("Utforsk grupper og samfunn?", style: TextStyle(fontSize: 22, color: Colors.black,), textAlign: TextAlign.center),
          
         Column(children: <Widget>[
           RaisedButton(
             child: Text("Fullfør"), onPressed: () {},
           )
          ],
        ),
        ],
      )
    );
  }
}