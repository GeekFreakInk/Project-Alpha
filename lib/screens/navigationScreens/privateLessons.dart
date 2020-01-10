import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/app_localization.dart';

class PrivateLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("privateLessons")),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du kjøpe privatundervisning'),
        ))
        );
  }
}