import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/shared/app_localization.dart';


class PrivateLessons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("privateLessons_")),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du kjøpe privatundervisning'),
        ))
        );
  }
}