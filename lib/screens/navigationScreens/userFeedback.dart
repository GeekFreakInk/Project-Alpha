import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/app_localization.dart';

class UserFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("feedback_")),
        ),
        body: Container(
            child: Center(
          child: Text('Her kan du sende tilbakemeldinger'),
        ))
        );
  }
}