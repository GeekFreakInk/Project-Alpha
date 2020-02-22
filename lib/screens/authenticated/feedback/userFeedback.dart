import 'package:flutter/material.dart';
import 'package:studybuddy_mobile/screens/authenticated/widgetRepository/mediumWidgets/feedback.dart';
import 'package:studybuddy_mobile/shared/app_localization.dart';

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