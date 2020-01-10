import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/app_localization.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('placeholder'),//Text(AppLocalizations.of(context).translate("settings")),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du endre dine instillinger'),
        ))
        );
  }
}
