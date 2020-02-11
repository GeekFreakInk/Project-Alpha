import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/app_localization.dart';
import 'package:studybuddy_mobile/screens/navigationScreens/widgetReoisitory/mediumWidgets/feedback.dart';

class UserFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context).translate("feedback_")),
        ),
        body: Container(
            margin: EdgeInsets.all(25),
            child: FeedbackWidget(),
          ),
        );
    }
}