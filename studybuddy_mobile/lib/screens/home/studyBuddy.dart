import 'package:flutter/material.dart';

class StudyBuddy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('StudyBuddy'),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du lete etter studybuddy'),
        ))
        );
  }
}